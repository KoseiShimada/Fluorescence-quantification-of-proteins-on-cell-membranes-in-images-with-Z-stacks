//写真の名前の所得
run("Z Project...", "projection=[Sum Slices]");
orgtitle=getTitle();
//複製して、片方を２値化して、もう片方からその領域だけ抽出する
run("Duplicate...", "title=" + orgtitle + "-1 duplicate");
selectWindow(orgtitle+ "-1");
//平均化フィルターでノイズを取り除いてから、鮮鋭化
run("Mean...", "radius=1 stack");
run("Unsharp Mask...", "radius=10 mask=0.60 stack");
setAutoThreshold("Otsu dark no-reset");
setThreshold(350, 20000);
setOption("BlackBackground", true);
run("Convert to Mask", "method=Otsu background=Dark black");
run("Divide...", "value=255.00000 stack");
imageCalculator("Multiply create stack", orgtitle,orgtitle+"-1");
caltitle=getTitle();
run("ROI Manager...");
makeRectangle(1, 1, 512, 512);
run("ROI Manager...");
roiManager("Add");
roiManager("Measure");

