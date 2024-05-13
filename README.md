# Final Degree Project

Repository implemented to develop my final dual degree project:

> - **Computer Science**: Data Engineer Project at KDB+/q.
> - **Business Administration**: The Ideal Conditions for ETFs to invest in.

## Computer Science: Data Engineer Project at KDB+/q

The main idea is create an entire data engineer process on Jupyter Notebook, using the main tool kernel: KDB+/Q.

The entire project are created over environment called "kdb" created using [Miniconda 24.3.0](https://docs.anaconda.com/free/miniconda/) and [kdb+/q kernel 4.1](https://kx.com/kdb-personal-edition-download/) released on February 2024
([4.1 info](https://kx.com/blog/discover-kdb-4-1s-new-features/)).

This it's opcional, but I did to have in different envs the kernel that I usually used.

### To configure your Anaconda "KDB" enviroment (Linux)

1. Download [Anaconda](https://www.anaconda.com/download/) or [Miniconda](https://docs.anaconda.com/free/miniconda/miniconda-install/) (my choice).

2. Create conda env with python version (at least 3.10 to use kdb+ kernel 4.1)

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

All you have to use is the ***kdb-data-engineer-tfg.ipynb***. From there you can run anything you need (for now, it's still in development!).

We created an ETL project structure, which involves learning: kdb+, q language, Python, Python graphical libraries, integrations, data processing... in short, a complete project.

## Business Administration: The Ideal Conditions for ETFs to invest in

The main objective is to create a study environment for Blackrock's main ETFs (in US dollars) to try to determine the best parameters or configurations to predict how the price will behave.

We will take advantage of the structure and capabilities offered by q and qSQL to manage and manipulate this data.

In the notebook we will prepare the data and consult them in order to draw valid conclusions for our objectives of isolating and finding good indicators.
