# EVclouds_Classification_WACV2019
Recognize the Gesture for DVS sensors using Event Clound Method

[**Note**] This tensorflow code is modified from: [[qwang014/EVclouds_gesture_recognition](https://github.com/qwang014/EVclouds_gesture_recognition)], which is the code of [[Space-time event clouds for gesture recognition: From RGB cameras to event cameras
](https://cse.buffalo.edu/~jsyuan/papers/2019/WACV_2019_Qinyi.pdf)], Wang Q, Zhang Y, Yuan J, et al. 2019 IEEE Winter Conference on Applications of Computer Vision (WACV). IEEE, 2019: 1826-1835. 

As the original code does not provide detailed document. Here, I try to give a more detailed introduction. But current code can only achieve 20% accuracy on the Gesture Recognition dataset (IBM). Therefore, still debugging ... 

![fig-1](https://github.com/wangxiao5791509/EVclouds_Classification_WACV2019/blob/main/Screenshot%20from%202021-09-04%2009-03-06.png)


## Environment 
```
conda create -n evclound python=2.7
conda activate evclound 

pip install matplotlib sklearn tensorboard
conda install -c anaconda tensorflow-gpu==1.0.1


git clone https://github.com/wangxiao5791509/EVclouds_Classification_WACV2019 
cd EVclouds_Classification_WACV2019 
```

## Download and pre-process the dataset: 
1. Download the Gesture Recognition dataset from: [[IBM-Gesture-DVS](https://www.research.ibm.com/interactive/dvsgesture/)] 
2. Unzip the file and move it into the main folder: DVS_Gesture_dataset_IBM 
3. cd data_preparation, and run the generate_train_data.py and generate_test_data.py. 

```
cd data_preparation 
python2.7 generate_train_data.py
python2.7 generate_test_data.py
```


It will generate the following files: 

```
/home/wangxiao/Documents/projects/EVclouds_WACV2019/data_preparation/C10_TS1_1024/W05S025/
train_0.h5
train_1.h5
train_2.h5
train_3.h5
train_4.h5
train_5.h5
train_6.h5
test_0.h5
```


## Training 

**1. Compile the third party tools**: 

First of all, you need to change the path of **cuda** and **tensorflow** for all the following .sh files. For example, I use cuda-11.2, python2.7, tensorflow path is "/home/wangxiao/anaconda3/envs/evclound/lib/python2.7/site-packages/tensorflow/include". 

```
cd tf_ops/3d_interpolation && sh tf_interpolate_compile.sh 
cd ../grouping && sh tf_grouping_compile.sh 
cd ../sampling && sh tf_sampling_compile.sh 
cd ../../
```

**2. Change the path in the provider.py (line 91) with your own path**: 
```
f = h5py.File("/home/wangxiao/Documents/projects/EVclouds_WACV2019/data_preparation/C10_TS1_1024/W05S025/" + h5_filename) 
```

**3. Run the train.py**:
```
python2.7 train.py 

Tensor("Placeholder_2:0", shape=(), dtype=bool, device=/device:GPU:0)
**** EPOCH 000 ****
----train file 0-----
train_5.h5
/home/wangxiao/Documents/projects/EventNet_benchmark/EVclouds_WACV2019/provider.py:91: H5pyDeprecationWarning: The default file mode will change to 'r' (read-only) in h5py 3.0. To suppress this warning, pass the mode you need to h5py.File(), or set the global default h5.get_config().default_file_mode, or set the environment variable H5PY_DEFAULT_READONLY=1. Available modes are: 'r', 'r+', 'w', 'w-'/'x', 'a'. See the docs for details.
  f = h5py.File("/home/wangxiao/Documents/projects/EventNet_benchmark/EVclouds_WACV2019/data_preparation/C10_TS1_1024/W05S025/" + h5_filename)
mean loss: 2.868542
accuracy: 0.113462
----train file 1-----
train_3.h5
mean loss: 2.721077
accuracy: 0.133479
----train file 2-----
train_0.h5
mean loss: 2.664037
accuracy: 0.144439
----train file 3-----
train_1.h5
mean loss: 2.681107
accuracy: 0.134000
----train file 4-----
train_6.h5
mean loss: 2.629317
accuracy: 0.136194
----train file 5-----
train_4.h5
mean loss: 2.681318
accuracy: 0.125250
```



## Testing 
```
python2.7 evaluate.py

You can check the training curves with the following script: 
tensorboard --logdir=/home/wangxiao/Documents/projects/EVclouds_WACV2019/log/train/
```

![fig-1](https://github.com/wangxiao5791509/EVclouds_Classification_WACV2019/blob/main/Screenshot%20from%202021-09-04%2008-54-08.png)




## Cite: 
If you find the code useful for your research, please cite their paper: 
```bibtex
@inproceedings{wang2019space,
  title={Space-time event clouds for gesture recognition: From RGB cameras to event cameras},
  author={Wang, Qinyi and Zhang, Yexin and Yuan, Junsong and Lu, Yilong},
  booktitle={2019 IEEE Winter Conference on Applications of Computer Vision (WACV)},
  pages={1826--1835},
  year={2019},
  organization={IEEE}
}
```

 

