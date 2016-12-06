import pandas as pd

tasks = pd.read_csv("tasks", sep=" ")
tasks[0] = pd.to_datetime(tasks[0], format="%m%d%Y")
tasks = tasks.sort_values(0)
tasks.to_csv("tasks", header=False, index=False)
