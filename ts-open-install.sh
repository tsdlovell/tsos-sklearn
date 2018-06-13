# set up your fork
# log into github with your ts affiliated account
# browse to https://github.com/scikit-learn/scikit-learn
# click 'Fork' in the top right
# you should now be at https://github.com/<username>/scikit-learn
repo_url=https://github.com/USERNAME/scikit-learn
git clone $repo_url


# if you don't have conda
wget https://repo.continuum.io/miniconda/Miniconda3-4.5.4-Linux-x86_64.sh && \
	bash ./Miniconda3-4.5.4-Linux-x86_64.sh -b -p ~/miniconda && \
	export PATH=~/miniconda/bin:$PATH
	# echo 'export PATH=~/miniconda/bin:$PATH' >> ~/.bashrc


# scikit-learn should be in cwd
# else at `pip install` you'll see:
# 	scikit-learn should either be a path to a local project or a VCS url beginning with svn+, git+, hg+, or bzr+
core="scikit-learn cython"
test="coverage pyflakes pep8 autopep8 pytest pytest-cov"
doc="sphinx numpydoc matplotlib pillow" # nomkl?
conda create --yes --name sklearn $core $test $doc && \
	source activate sklearn && \
	conda remove --yes scikit-learn && \
	pip install --editable scikit-learn && \
	pip install sphinx_gallery


cd scikit-learn
git remote add upstream https:/github.com/scikit-learn/scikit-learn
