_(Video below was made in [**AAA**](http://www.articulateinstruments.com/downloads/), software for speech articulatory analysis and recording by **Articulate Instruments**)_
[![Speaker 20fs in the test set, included with this project](Installation_Instructions/Other_Files/Demo/demo.gif)](Installation_Instructions/Other_Files/Demo/demo.mp4?raw=true)

How to use this project
-----------------------
1. To download all the files needed to run this project, you can use git to run the command: 

    `git clone https://github.com/articulateinstruments/DeepLabCut-for-Speech-Production/` 
    
    or [click this link to download the project as a .zip file](https://github.com/articulateinstruments/DeepLabCut-for-Speech-Production/archive/refs/heads/master.zip).
    _(737 MB download / 1.48 GB on disk)_

2. [Click here for instructions on how to install DeepLabCut and run this project.](Installation_Instructions) _(DeepLabCut will be 2.97 GB on disk)_
3. [Click here for instructions on how to use this project to analyse data](INSTRUCTIONS.md). 

Both guides contain detailed walk-throughs for people who are new to using DeepLabCut.

You do not need a GPU in your computer to use these models: you should be able to run this project on most PCs. If you have a powerful GPU then you can use it with this project to analyse data significantly faster.


What this project contains
--------------------------
This repository contains:
- 4 pre-trained models that are ready to use, specifically:
    - [2 Ultrasound tongue surface, mandible, hyoid and short-tendon tracking models](Ultrasound/dlc-models/iteration-0), for use on midsaggital ultrasound videos where the tongue tip is to the right.
    - [2 Lip tracking models](Lips/dlc-models/iteration-0), for use on front-facing videos of human lips.
- [1 set of hand-labeled Ultrasound training data](Ultrasound/labeled-data).
- [1 set of hand-labeled Lip training data](Lips/labeled-data).
- [1 set of hand-labeled Ultrasound test data](Ultrasound/labeled-data/UTI_Test_Set_COMBINED_ALL).
- [1 set of hand-labeled Lip test data](Lips/labeled-data/LipTest_COMBINED_TEST).


Authors 
-------
This research using DeepLabCut for speech production is by [Wrench, A.](https://scholar.google.com/citations?user=HQkwGZEAAAAJ) and Balch-Tomes, J. (2021).

DeepLabCut software was developed by [Mathis, A.](https://scholar.google.co.uk/citations?user=Y1xCzE0AAAAJ), [Mamidanna, P.](https://scholar.google.co.uk/citations?user=5x1hXY8AAAAJ), [Cury, K.M.](https://scholar.google.co.uk/citations?user=KpSNbF4AAAAJ) et al. (2018) ([10.1038/s41593-018-0209-y](https://www.nature.com/articles/s41593-018-0209-y)) with additional software by [Nath, T.](https://scholar.google.co.uk/citations?user=KXmpTjwAAAAJ), [Mathis, A.](https://scholar.google.co.uk/citations?user=Y1xCzE0AAAAJ) et al. (2019) ([10.1038/s41596-019-0176-0](https://www.nature.com/articles/s41596-019-0176-0)) and [Mathis, A.](https://scholar.google.co.uk/citations?user=Y1xCzE0AAAAJ), [Biasi T.](https://www.researchgate.net/profile/Thomas-Biasi) et al. (2021)
