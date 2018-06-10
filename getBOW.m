function [ output ] = getBOW( data,FV )
bow=zeros(size(data,1),size(FV,2)+1); %0 is ham -- 1 is spam
for i=1:size(data,1)
     split= regexp(data{i,2},'\s','split');
     for j=1:size(split,2)
      index=find(ismember(FV,split{1,j}));   
      bow(i,index)=bow(i,index)+1;  
     end
     if(strcmp(data{i,1},'ham')==1)
         bow(i,size(FV,2)+1)=0;
     else
         bow(i,size(FV,2)+1)=1;
     end  
end
output=bow;
end

