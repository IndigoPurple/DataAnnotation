clc;
A = imread('F:\Giga\primary_school\primary_school_20180913_3\stitched\0001.jpg');% 在这里输入源文件的位置
[m,n,l] = size(A);%m行数，代表宽度；n列数，代表长度
a  = 8;
p=[];
for i = 1:a
    for j = 1:a
        m_start = 1 + (i-1)*fix(m/a);
        m_end = i*fix(m/a);
        n_start = 1 + (j-1)*fix(n/a);
        n_end = j*fix(n/a);
        AA = A(m_start:m_end,n_start:n_end,:);
        imshow(AA);
        hold on;  
        try
           while true
             k=ginput(1);
             c_a=k(1);
             c_b=k(2);
             k(1)=n_start+k(1);
             k(2)=m_start+k(2);
             p=[p;k];
             plot(c_a,c_b,'r*');
           end     
        catch  
            %pass          
        end  
    end
end
image_info.location=p;
b=size(p);
image_info.number=b(1);
save F:\Giga\primary_school\primary_school_20180913_3\info\GT_IMG_0001.mat image_info;%在这里输入存储位置信息的位置