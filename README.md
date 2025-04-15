# Final Degree Project

Repository implemented to develop my final dual degree project:

> - **COMPUTER SCIENCE**: Data Engineer Project at KDB+/q.
> - **BUSINESS ADMINISTRATION**: Historical analysis of returns, volatility and risk in BlackRock ETFs

___

# Data Engineer Project at KDB+/q

The main idea is create an entire data engineer process on Jupyter Notebook, using the main tool kernel: KDB+/Q.

The entire project are created over environment called "kdb" created using [Miniconda 24.3.0](https://docs.anaconda.com/free/miniconda/) and [kdb+/q kernel 
4.1](https://kx.com/kdb-personal-edition-download/) released on February 2024 ([4.1 info](https://kx.com/blog/discover-kdb-4-1s-new-features/)).

This it's opcional, but I did to have in different envs the kernel that I usually used.

### To configure your Anaconda "KDB" enviroment (Linux)

1. Download [Anaconda](https://www.anaconda.com/download/) or [Miniconda](https://docs.anaconda.com/free/miniconda/miniconda-install/) (my choice).

2. Create conda env with python version (at least 3.6 to use kdb+ 4.X kernel version):

```
 conda activate
 conda create --name kdb python=3.10
```

3. Activate env:

```
 conda activate kdb
```

Now you should see something like:
```
(kdb) [your machine]$:
```
4. Installing kdb+:

```
 conda install -c kx kdb
```

5. Now execute q and add the license([Get Free License](https://kx.com/kdb-personal-edition-download/)).

```
 q
```

6. To use KDB+/Q kernel on Jupyter Notebook you have to added ***JupyterQ***:

```
 conda install -c kx jupyterq
```

7. Execute a jupyter session and start to managed the info:

 ```
 jupyter notebook
```

If your license are correct install the *JupyterQ* will be able to manage. If your jupyter cannot reconize your license or whatever other problem, you can check this blog where 
they confiurate the kernel manually.

[Manual KDB+/q jupyter kernel configuration](http://www.enlistq.com/installing-kdb-jupyterq-and-embedpy-using-conda/).

### Info + Structure

- All you have to use for generate date enrichment → ***dataETL.ipynb***.
- For visualizate and agrupation of volatilities followings performance → ***dataAnalytics.ipynb***.

We created an ETL project structure, which involves learning: kdb+, q language, Python, Python graphical libraries, integrations, data processing... in short, a complete project.
___

# Historical Analysis of Returns, Volatility and Risk in BlackRock ETFs

- The main objective is to create a study environment for Blackrock's main ETFs (in US dollars) to try to valorate the situation of these ETF.
- Secondly, create an estimate based on the past, taking the premise that the market is cyclical.
- 
Therefore we will study 2 types of critical points:
> - What happens to drawdowns and volatilities when we reach a cumulative % loss?
> - What happens to drawdowns and volatilities when we reach a % of accumulated profits?

Then → **we will be able to group and categorise the variables in order to make decisions on when to buy and when to sell**.

Subsequently we will group the volatilities and drawdowns on sell/buy alerts moments and we will place the different ETFs according to their situation assessment.
We will be able to determine the quartiles and the maximum and minimum drawdowns at those times, which is key to the estimates. For this we will use Matplotlib for visualization added to Q 
language calculations done in the ETL proccess.

![EWG relevant moments at 5 years period](https://github.com/user-attachments/assets/f3ab2bc4-857d-455d-84aa-77a30d346490)



We will take advantage of the structure and capabilities offered by Q and qSQL to manage and manipulate this data.

___

[![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg


