## **You are currently viewing a more recent, improved training set** which expands on the research published in February 2022.
### If you want to view the data originally provided with the paper _["Beyond the Edge: Markerless Pose Estimation of Speech Articulators from Ultrasound and Camera Images Using DeepLabCut"](https://www.mdpi.com/1424-8220/22/3/1133) by [Wrench, A.](https://scholar.google.com/citations?user=HQkwGZEAAAAJ) & Balch Tomes, J._ at the time of publication, then please [click here](https://github.com/articulateinstruments/DeepLabCut-for-Speech-Production).
---
# Markerless pose estimation of speech articulators from ultrasound tongue images and lip video
[![Speaker 20fs in the test set, included with this project](Installation_Instructions/Other_Files/Demo/demo.gif)](Installation_Instructions/Other_Files/Demo/demo.mp4?raw=true)

These videos show the performance of the model on **speakers that were not included in the training set**. The video below also shows the performance on an **ultrasound system, probe geometry and framerate which were not represented in the training set**.

The ultrasound model estimates the position of **11 keypoints along the tongue surface** plus a further 3 keypoints on the **hyoid**, **base of the mandible** and mental spine where **short tendon** attaches to mandible.

_(The video above was made in [**AAA**](http://www.articulateinstruments.com/downloads/), software for speech articulatory analysis and recording by **Articulate Instruments**, using the pose-estimation models in this project trained using [**DeepLabCut**](https://github.com/DeepLabCut/DeepLabCut/) ([Mathis, A.](https://scholar.google.co.uk/citations?user=Y1xCzE0AAAAJ), [Mamidanna, P.](https://scholar.google.co.uk/citations?user=5x1hXY8AAAAJ), [Cury, K.M.](https://scholar.google.co.uk/citations?user=KpSNbF4AAAAJ) et al.). The video below was created using DeepLabCut's built-in video export)._

[![Speaker DF in the test set, included with this project](Installation_Instructions/Other_Files/Demo/demo2.gif)](Installation_Instructions/Other_Files/Demo/demo2.mp4?raw=true)


How to use this project
-----------------------
1. To download all the files needed to run this project, you can clone this repository:

    `git clone https://github.com/articulateinstruments/DeepLabCut-for-Speech-Production.git`

    or [click this link to download the project as a .zip file](https://github.com/articulateinstruments/DeepLabCut-for-Speech-Production/archive/refs/heads/main.zip).
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
This research using DeepLabCut for speech production is by [Wrench, A.](https://scholar.google.com/citations?user=HQkwGZEAAAAJ) and Balch-Tomes, J. (2022) ([10.3390/s22031133](https://www.mdpi.com/1424-8220/22/3/1133)).

DeepLabCut software was developed by [Mathis, A.](https://scholar.google.co.uk/citations?user=Y1xCzE0AAAAJ), [Mamidanna, P.](https://scholar.google.co.uk/citations?user=5x1hXY8AAAAJ), [Cury, K.M.](https://scholar.google.co.uk/citations?user=KpSNbF4AAAAJ) et al. (2018) ([10.1038/s41593-018-0209-y](https://www.nature.com/articles/s41593-018-0209-y)) with additional software by [Nath, T.](https://scholar.google.co.uk/citations?user=KXmpTjwAAAAJ), [Mathis, A.](https://scholar.google.co.uk/citations?user=Y1xCzE0AAAAJ) et al. (2019) ([10.1038/s41596-019-0176-0](https://www.nature.com/articles/s41596-019-0176-0)) and [Mathis, A.](https://scholar.google.co.uk/citations?user=Y1xCzE0AAAAJ), [Biasi T.](https://www.researchgate.net/profile/Thomas-Biasi) et al. (2021)
