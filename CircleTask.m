function CircleTask(~,event)
 event_time = datestr(event.Data.time);   %ʹ��event�����data��time���Ի��ϵͳ��ǰʱ�䣬��ת�����ַ���
 d=event_time(19:20);   %���ڱ��������������Сʱ�����룬����ֻ��Ҫ������ݣ���˵���ȡ��
 d=str2double(d); %���ַ���ת��������
filepath='E:\zd8m\';
filename=[filepath,'DEC\\1100208X060',datestr(now,'yyyymmdd'),'.epd'];
filenamee=[filepath,'DEC\\����1100208X060',datestr(now,'yyyymmdd'),'.epd'];
cotent=['DEC\\1100208X060',datestr(now,'yyyymmdd'),'.epd']; 
f=ftp('10.11.51.39:22','zsj','61111955');%����ftp������    
dir(f);%��ʾftp�������������ļ�
mget(f,cotent,filepath);%�����������ļ����ص�����ָ�����ļ�����
close(f);%�ر�ftp 
fidr=fopen(filename,'r');
fidw=fopen(filenamee,'wt');
while ~feof(fidr)
    s=fgetl(fidr);
    s=strrep(s,'NULL','nan');
    fprintf(fidw,'%s\n',s);
end
fclose(fidr);
fclose(fidw);
A=importdata(filenamee);%�����ݵ������A��
% A=A.data;
% a=A;
% [m,n]=find(isnan(a)==1);
% a(m,:)=[];
% A=a;
subplot(2,1,1);plot(A(:,2));%????
xlabel('/h');
ylabel('��.m');
set(gca,'XTick',0:1:24)
subplot(2,1,2);plot(A(:,5));
xlabel('/h');
ylabel('��.m');
set(gca,'XTick',0:1:24)
if size(A,1)>=2
%     kong=floor(A(end,1)/100)*60+(A(end,1)/100-floor(A(end,1)/100))*100-floor(A(end-1,1)/100)*60-(A(end-1,1)/100-floor(A(end-1,1)/100))*100;
   A1=[A(end-2:end,1),A(end-2:end,2),A(end-2:end,3),A(end-2:end,4),A(end-2:end,5),A(end-2:end,6),A(end-2:end,7),A(end-2:end,8),A(end-2:end,9)];
    kong=numel(A1(isnan(A1)))/9;
    if kong>=2
        msgbox('�۲�������������СʱΪNULL')
        Fs = 44100; % ����Ƶ��
        FT = 4;     % ʱ�䳤��
        Fn = Fs*FT;  % ��������
        Ff = 500;   % ����Ƶ��
        Fy = sin(2*pi*Ff*FT*linspace(0,1,Fn+1));
        sound(Fy,Fs)
    end
end
delete(filenamee);
end