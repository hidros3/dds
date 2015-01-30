# coding: utf-8
import pandas as pd
import numpy as np
df = pd.read_csv("http://taekjoobucket.s3.amazonaws.com/data/nyt1.csv")
df["Age Group"] = pd.cut(df["Age"], [-np.Inf, 0, 18, 28, 38, 48, 58, 68, np.Inf])
df.head(10)
df["Age Group"] = pd.cut(df["Age"], [-np.Inf, 0, 18, 28, 38, 48, 58, 68, np.Inf], labels=["ZERO","U18", "U24","U34", "U44", "U54", "U64", "Over64"])
df.head(10)
get_ipython().magic(u'save dds.py 1-8')
