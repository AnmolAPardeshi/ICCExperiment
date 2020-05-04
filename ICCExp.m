clear
close
clc
%generate dataset with equal average
x1=[50;100;100;100;150];
x2=[40;100;100;120;140];
x=[x1 x2];
status=["Trial","Mean1","Mean2","ICC"];
%perform calculations
meanArray=[mean(x(:,1)) mean(x(:,2))];
[ICCoeff,lb,ub]=ICC(x,'1-1');
status=[status ; "Original Dataset" meanArray(1) meanArray(2) ICCoeff];
%tweak datasets - lower both averages unproportionally
x=[x;87 23];
meanArray=[mean(x(:,1)) mean(x(:,2))];
[ICCoeff,lb,ub]=ICC(x,'1-1');
status=[status ; "LoweredAvg" meanArray(1) meanArray(2) ICCoeff];
x(end,:)=[];
%tweak datasets - higher both averages
x=[x;112 136];
meanArray=[mean(x(:,1)) mean(x(:,2))];
[ICCoeff,lb,ub]=ICC(x,'1-1');
status=[status ; "RaisedAvg" meanArray(1) meanArray(2) ICCoeff];
x(end,:)=[];
%display
disp(status)