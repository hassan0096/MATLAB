function plotindividualw(w,peval,savethis,localize)
% plotindividualw(w,peval,savethis, localize)
if ~exist('localize','var')
    localize = 0;
end

[x_mu, y_mu sig] = localizew(w,peval);
wr=reshape(w, peval.nx, peval.ny, peval.ncomp);

for ii=1:peval.ncomp
    dipshow(wr(:,:,ii));
    if localize
        hold on
        scatter(x_mu(ii)-1, y_mu(ii)-1,'r')
        drawpixels([peval.nx, peval.ny],':r',-0.5)
        hold off
    end
    if savethis
        SaveImageFULL([peval.res_dir '/w' num2str(ii)],'e');
    end
end

