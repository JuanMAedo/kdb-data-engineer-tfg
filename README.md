# Final Degree Project

Repository implemented to develop my final dual degree project:

> - **COMPUTER SCIENCE**: Data Engineer Project at KDB+/q.
> - **BUSINESS ADMINISTRATION**: ETF investing modelling to reduce risk.

## Computer Science: Data Engineer Project at KDB+/q

The main idea is create an entire data engineer process on Jupyter Notebook, using the main tool kernel: KDB+/Q.

The entire project are created over environment called "kdb" created using [Miniconda 24.3.0](https://docs.anaconda.com/free/miniconda/) and [kdb+/q kernel 4.1](https://kx.com/kdb-personal-edition-download/) released on February 2024
([4.1 info](https://kx.com/blog/discover-kdb-4-1s-new-features/)).

This it's opcional, but I did to have in different envs the kernel that I usually used.

### To configure your Anaconda "KDB" enviroment (Linux)

1. Download [Anaconda](https://www.anaconda.com/download/) or [Miniconda](https://docs.anaconda.com/free/miniconda/miniconda-install/) (my choice).

2. Create conda env with python version (at least 3.6 to use kdb+ kernel)

```
 conda activate
 conda create --name kdb python=3.10
```

3. Activate env

```
 conda activate kdb
```

Now you should see something like:

> (kdb) [your machine]$ :

4. Installing kdb+

```
 conda install -c kx kdb
```

5. Now execute q and add the license that you should recieve at your email ([free license](https://kx.com/kdb-personal-edition-download/))

```
 q
```

6. To use KDB+/Q kernel on Jupyter Notebook you have to added:

```
 conda install -c kx jupyterq
```

7. Execute a jupyter session and start to managed the info.

 ```
 jupyter notebook
```

If your license are correct install the *jupyterq* will be able to manage. If your jupyter cannot reconize your license or whatever other problem, you can check this blog where they confiurate the kernel manually. Be careful with versions used it!

[Manual KDB+/q jupyter kernel configuration](http://www.enlistq.com/installing-kdb-jupyterq-and-embedpy-using-conda/).

### Info + Structure

- All you have to use is the ***ETLData.ipynb***. From there you can run anything you need (<mark>**In Development**</mark>).
- For visualizate and test the benchmark, you will have to use ***visualizate.ipynb*** (<mark>**First step done. Preparing scripts**</mark>).

We created an ETL project structure, which involves learning: kdb+, q language, Python, Python graphical libraries, integrations, data processing... in short, a complete project.

## Business Administration: ETF investment modelling to reduce risk

- The main objective is to create a study environment for Blackrock's main ETFs (in US dollars) to try to valorate the situation of these ETF. (<mark>**In Development**</mark>)
- Secondly, create a model to choose a portfolio based on valuations (<mark>**Not started**</mark>).

To develop this model, we will use [Boglehead portfolio theories](https://www.bogleheads.org/wiki/Main_Page) fixed with other ETF investing theories, creating a ideal portfolio to reduce risk as much as possible.

The first part of thesis will be to create the model in a theoretical way, in order to be able to put it into practice and to be able to analyse in example the set of BlackRock ETFs chosen.

We will use a crative benchmark where we will place the different ETFs according to their situation assessment. For this we will use Matplotlib for visualization added to Q language calculations done in the ETL proccess.


We will take advantage of the structure and capabilities offered by Q and qSQL to manage and manipulate this data.

---
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>
This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>