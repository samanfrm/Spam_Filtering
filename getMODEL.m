function [ output ] = getMODEL(data,FV,bow )
  model=zeros(2,size(FV,2)+3);
  model(1,1)=0;model(2,1)=1; %0 is ham--1 is spam
  len=size(FV,2);
  model(1,2)=((size(data,1)-nnz(bow(:,size(FV,2)+1)))+1)/(size(data,1)+len); %probabillity of ham
  model(2,2)=(nnz(bow(:,size(FV,2)+1))+1)/(size(data,1)+len);%probability of spam
  
  %counter  of all ham
  indices=find(bow(:,size(FV,2)+1)==0);
  total=0;
  for i=indices'
      total=total+sum(bow(i,:));
  end
  model(1,3)=total;
  
  %counter  of all spam
  indices=find(bow(:,size(FV,2)+1)==1);
  total=0;
  for i=indices'
      total=total+sum(bow(i,:));
  end
  model(2,3)=total;
  
  %calculate all of features probability
  for i=4:size(FV,2)+3
       indices=find(bow(:,size(FV,2)+1)==0); % ham
       total=0;
       for j=indices'
           total=total+sum(bow(j,i-3));
       end
       model(1,i)=(total+1)/(model(1,3)+len);
       
       indices=find(bow(:,size(FV,2)+1)==1); % spam
       total=0;
       for j=indices'
           total=total+sum(bow(j,i-3));
       end
       model(2,i)=(total+1)/(model(2,3)+len);
  end
  
  output=model;
end

