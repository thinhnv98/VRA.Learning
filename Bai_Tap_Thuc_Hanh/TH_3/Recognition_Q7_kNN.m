function Recognition_Q7_kNN()
    imgTrainAll = loadMNISTImages ('./train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels ('./train-labels.idx1-ubyte');
    imgTestAll = loadMNISTImages ('./t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels ('./t10k-labels.idx1-ubyte');
    nNumber = size(imgTestAll, 2);
    rArray = zeros(1, 10);
    Mdl = fitcknn (imgTrainAll', lblTrainAll);
    lblResult = predict(Mdl,imgTestAll');
    nResult = (lblResult == lblTestAll);
    for i = 1 : nNumber
        if(nResult(i) == 0)
                rArray(lblTestAll(i)+1) =  rArray(lblTestAll(i)+1) + 1;
        end
    end
    for i = 1 : 10
        fprintf('\n So %d sai la: %d ', i - 1, rArray(i));
    end
end