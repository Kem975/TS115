function H = entropy(iteration, axis)
    sum=0;
    proba=zeros(1,20); %Pas obligatoire mais utile pour récupérer les valeurs des probas pour vérifier
    for i=1:1:20
        proba(i) = iteration(i)/10001;
        sum = sum + proba(i)*log(proba(i));
    end
    
    H = -sum;
    
end

