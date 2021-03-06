function feaout=refinewitharmax(feain,hmax)
feaout=feain;
clear feain
[l1max,i1max]=max(feaout.el(:,5:7));
[lmax,i2max]=max(l1max);
[armax,iar]=max(feaout.el(:,8));
ln=length(feaout.xn);
while((lmax>hmax)|(armax>10))
    ln=ln+1;
    if(lmax>hmax)
        if(i2max==1)
            p1=feaout.el(i1max(i2max),1);
            p2=feaout.el(i1max(i2max),2);
        elseif(i2max==2)
            p1=feaout.el(i1max(i2max),2);
            p2=feaout.el(i1max(i2max),3);
        else
            p1=feaout.el(i1max(i2max),3);
            p2=feaout.el(i1max(i2max),1);
        end
        feaout.xn(ln)=0.5*(feaout.xn(p1)+feaout.xn(p2));
        feaout.yn(ln)=0.5*(feaout.yn(p1)+feaout.yn(p2));
        [i1,j1]=find(feaout.el(:,1:3)==p1);
        el1=feaout.el(i1,:);
        [i2,j2]=find(el1(:,1:3)==p2);
        for i=1:length(i2)
            feaout.el=insertnode(feaout.el,feaout.xn,feaout.yn,ln,el1(i2(i),12));
        end
    else
        [ear,imax]=max(feaout.el(iar,5:7));
        if(imax==1)
            p1=feaout.el(iar,1);
            p2=feaout.el(iar,2);
        elseif(imax==2)
            p1=feaout.el(iar,2);
            p2=feaout.el(iar,3);
        else
            p1=feaout.el(iar,3);
            p2=feaout.el(iar,1);
        end
        feaout.xn(ln)=0.5*(feaout.xn(p1)+feaout.xn(p2));
        feaout.yn(ln)=0.5*(feaout.yn(p1)+feaout.yn(p2));
        [i1,j1]=find(feaout.el(:,1:3)==p1);
        el1=feaout.el(i1,:);
        [i2,j2]=find(el1(:,1:3)==p2);
        for i=1:length(i2)
            feaout.el=insertnode(feaout.el,feaout.xn,feaout.yn,ln,el1(i2(i),12));
        end
    end
    [l1max,i1max]=max(feaout.el(:,5:7));
    [lmax,i2max]=max(l1max);
    [armax,iar]=max(feaout.el(:,8));
end
plotmesh(feaout)