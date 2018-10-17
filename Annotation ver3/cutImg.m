function image_info = cutImg(fileName)
    clc;
    disp(['Working on Image ', fileName])
    A = imread(fileName);% ����������Դ�ļ���λ��
    resizeFactor = 12;
    % Ar = imresize(A);
    [m,n,l] = size(A);%m�����������ȣ�n������������
    a = 3;
    p=[];
    figure;
    for i = 1:a
        for j = 1:a
            sure = 0;
            while(~sure)
                m_start = 1 + (i-1)*fix(m/a);
                m_end = i*fix(m/a);
                n_start = 1 + (j-1)*fix(n/a);
                n_end = j*fix(n/a);
                AA = A(m_start:m_end,n_start:n_end,:);
                imshow(AA);
                hFig = gcf;
                hAx = gca;
                set(hFig, 'units', 'normalized', 'outerposition', [0 0 0.5 1])
                set(hAx, 'units', 'normalized', 'outerposition', [-0.12 0 1.2 1])
                [curXPos, curYPos]=getpts;
                hold on
                plot(curXPos, curYPos, '*r');
                hold off
                prompt = 'are you sure? o:ok, Other:No [no]: ';
                curArg = input(prompt, 's');
                
                if isempty(curArg)
                    disp('Let''s do it again. ')
                    sure = 0;
                else
                    if curArg == 'o'
                        sure = 1;
                        curXPos = n_start + curXPos;
                        curYPos = m_start + curYPos;
                        p=[p;floor([curXPos, curYPos])];
                        disp('Points in Current Frame Added to image_info');                        
                    
                    else
                        disp('Let''s do it again. ')
                        sure = 0;
                    end
                end
            end
        end
    end
    close; 

    image_info.location=p;
    b=size(p);
    image_info.number=b(1);
    save([fileName(1:end-3), 'mat'], 'image_info');%����������洢λ����Ϣ��λ��


















