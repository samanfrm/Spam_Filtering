function [ output ] = crossval( data )
 p=idivide(int32(size(data,1)),5,'floor');
 accuracy=zeros(1,5);
  for i=1:5
       dataTest=data((i-1)*p+1:i*p,:);
       dataTrain=[data(1:(i-1)*p,:);data(i*p+1:end,:)];
       model=main(dataTrain);
       tcount=0;
       for j=1:size(dataTest,1)
           predict=test1SMS(dataTest{j,2},model);
           if(strcmp(predict,dataTest{j,1})==1)
              tcount=tcount+1; 
           end  
       end
       accuracy(i)=tcount/size(dataTest,1);
  end
 output=mean(accuracy);
end

