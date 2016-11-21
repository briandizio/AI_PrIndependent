% Need to run PCA on historical matrices for each product


% First column is 'sales'
% Second column is 'I buy producti perennially'
%...
% Fifth column is 'I buy producti and I hate shopping'
historicalData = xlsread('AI_PrIndependent_InitialData.xlsx','ProductMatrices','B18:G137')

[d, k, p] = PCA(historicalData,.95)


numberOfYrs=20;
Yrs=cell(numberOfYrs+1,4);
for i=1:numberOfYrs
    Yrs{1,1}='reduced data, yr1 at top';
    Yrs{1,2}='sums across product';
    Yrs{1,3}='levels corresponding to ordered sums';
    Yrs{1,4}='index of max(sums across product)';
    % Split the data into years 
    Yrs{i+1,1}=d(6*(i-1)+1:i*6,:);
    % For each year, take the sum across rows to output the optimal product
    % QUESTION!!! Once we've projected the data, are we still
    % in percentage space? That is, what do the points represent? 
    % They're now still percentages but with only 3 dimensions as opposed
    % to what we started with?
    Yrs{i+1,2}=sum(Yrs{i+1,1},2);
    % Find maximum from each year and assign to third column of years
    Yrs{i+1,4}=find(Yrs{i+1,2}==max(Yrs{i+1,2}));
    % Give highest score highest level, level 1 = best product, level 6=
    % worst product
    oYrs=sort(Yrs{i+1,2},'descend');
    levels=[];
    for j=1:length(Yrs{i+1,2})
        levels(end+1)=find(oYrs==Yrs{i+1,2}(j));
    end
    Yrs{i+1,3}=levels';
    levels=[];
end

% Now we output the data.  What is the best format for Weka?
% col1=v1reduced,col2=v2reduced,col3=v3reduced,col4=level,col5=product#

tox=[]
for i=1:numberOfYrs
    toadd=horzcat(Yrs{i+1,1},Yrs{i+1,3},[1;2;3;4;5;6]);
    tox=vertcat(tox,toadd)
end

csvwrite('ProductData.csv',tox)
