Bootstrap: docker
From: excuseforjuice/uboonecode-8_00_00_21

%post
  mkdir -p /cluster/home
  mkdir -p /cluster/kappa
  mkdir -p /cluster/shared
  mkdir -p /opt/shared
  mkdir -p /usr/local/share/uboonecode-8_00_00_23
  bash
  source /products/setup

#now do uboonecode
  cd /usr/local/share/uboonecode-8_00_00_23
  setup mrb
  setup uboonecode v08_00_00_23 -q e17:prof
  export MRB_PROJECT=larsoft
  mrb newDev
  source /usr/local/share/uboonecode-8_00_00_23/localProducts_larsoft_v08_05_00_10_e17_prof/setup
  cd /usr/local/share/uboonecode-8_00_00_23/srcs
  mrb g uboonecode
  cd uboonecode
  git checkout tags/UBOONE_SUITE_v08_00_00_23
  cd /usr/local/share/uboonecode-8_00_00_23/build_slf6.x86_64
  mrbsetenv
  mrb i


#gotta build larlite, too. ugh.
  cd /usr/local/share
  git clone https://github.com/larlight/larlite.git
  cd larlite
#  git checkout dlreco
  git checkout ubdl_dev
  source config/setup_dl.sh
  make -j4

#and now python stuff
  pip install --upgrade pip
  pip install numpy
  pip install pandas
  pip install scipy
  pip install matplotlib
