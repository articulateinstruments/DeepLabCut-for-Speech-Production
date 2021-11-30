To install this project
-----------------------
**You cannot use this project immediately. You must first install it by running the file [`Install_Config_Files.bat`](Install_Config_Files.bat) by double-clicking it**. If you wish to install this project manually instead, please read the [detailed instructions found here](../INSTRUCTIONS.md#wheres-the-configyaml-files).

To install and run DeepLabCut
---------------------
First, please install [Anaconda](https://www.anaconda.com/products/individual).

Second, if you have a Nvidia GPU then please install the [CUDA drivers](https://developer.nvidia.com/cuda-downloads).

Third, if you're using Windows then **run the file [`Run_DeepLabCut.bat`](Run_DeepLabCut.bat) by double-clicking it**. That's it!

It is a script for Windows which installs DeepLabCut if it's not installed, updates it if it's installed, and runs it if it's up to date. It works on Windows 7 and later.

If you wish to install DeepLabCut manually instead, please follow the instructions at these links:
 - https://github.com/DeepLabCut/DeepLabCut/blob/master/docs/installation.md
 - https://deeplabcut.github.io/DeepLabCut/docs/recipes/installTips.html

If you have installed DeepLabCut and want to run it manually, open an Anaconda prompt (on Windows, you can find "Anaconda Powershell Prompt" or "Anaconda Prompt" in your Start Menu; either is fine to use) and activate the Anaconda environment you installed DeepLabCut in: `conda activate DEEPLABCUT`. If that for any reason does not work, you can list all installed Anaconda environments with `conda env list`. 

Then, run the following commands:
```
ipython
import deeplabcut
deeplabcut.launch_dlc()
```

If you're using Linux or MacOS you may need to use _wxpython_ instead. Please defer to the [official instructions](https://github.com/DeepLabCut/DeepLabCut/blob/master/docs/installation.md) provided by DeepLabCut.

-------------------
To use this project
-------------------
First, ensure you have completed the instructions above to install the project. Then, to use this project please refer to the [detailed instructions document](../INSTRUCTIONS.md).
