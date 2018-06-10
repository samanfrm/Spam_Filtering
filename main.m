function [ output ] = main( data )
  for i=1:size(data,1)
     data{i,2}=rmstops(data{i,2});
  end
  FV=getFV(data);
  bow=getBOW(data,FV);  
  probab=getMODEL(data,FV,bow);
  
output.bog=bow;
output.FV=FV;
output.probab=probab;
end

