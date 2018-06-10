 
acc=zeros(1,5);

% first accuracy
 dataTest=data(1:1100,:);
 tcount=0;
 for j=1:size(dataTest,1)
    predict=test1SMS(dataTest{j,2},model1);
    if(strcmp(predict,dataTest{j,1})==1)
              tcount=tcount+1;
    end  
 end
 acc(1)=tcount/size(dataTest,1);
 
 %second accuracy
 dataTest=data(1101:2200,:);
 tcount=0;
 for j=1:size(dataTest,1)
    predict=test1SMS(dataTest{j,2},model2);
    if(strcmp(predict,dataTest{j,1})==1)
              tcount=tcount+1;
    end  
 end
 acc(2)=tcount/size(dataTest,1);
 
 %third accuracy
 dataTest=data(2201:3300,:);
 tcount=0;
 for j=1:size(dataTest,1)
    predict=test1SMS(dataTest{j,2},model3);
    if(strcmp(predict,dataTest{j,1})==1)
              tcount=tcount+1;
    end  
 end
 acc(3)=tcount/size(dataTest,1);
 
  %fourth accuracy
 dataTest=data(3301:4400,:);
 tcount=0;
 for j=1:size(dataTest,1)
    predict=test1SMS(dataTest{j,2},model4);
    if(strcmp(predict,dataTest{j,1})==1)
              tcount=tcount+1;
    end  
 end
 acc(4)=tcount/size(dataTest,1);
 
 %fifth accuracy
 dataTest=data(4401:end,:);
 tcount=0;
 for j=1:size(dataTest,1)
    predict=test1SMS(dataTest{j,2},model5);
    if(strcmp(predict,dataTest{j,1})==1)
              tcount=tcount+1;
    end  
 end
 acc(5)=tcount/size(dataTest,1);
 clear j acc dataTest predict tcount
 CrossAccuracy=mean(acc)