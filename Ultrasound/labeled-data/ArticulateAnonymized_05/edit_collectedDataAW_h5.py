
import pandas as pd

#frame = pd.read_csv("CollectedData_AW.csv", header=[0,1,2], index_col=0, skiprows=0)
frame = pd.read_csv("CollectedData_AW.csv", header=[0,1,2], index_col=0)
frame.to_hdf("CollectedData_AW.h5", "df_with_missing", format="table", mode="w")
