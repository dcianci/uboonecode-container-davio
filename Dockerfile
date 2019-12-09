FROM scientificlinux/sl:6


RUN yum install -y freetype-devel git gitflow wget curl-devel \
         redhat-lsb-core openssh-clients curl-devel libxml2-devel \
	 mesa-libGLU-devel libSM-devel openssl-devel emacs vim && \
	 yum clean all

RUN mkdir /products && \
  wget https://scisoft.fnal.gov/scisoft/bundles/tools/pullProducts && \
 chmod +x pullProducts && \
  ./pullProducts /products slf6 uboone-08.00.00.23 s78-e17 prof && \
  rm *.tar.bz2

RUN  bash -c "source /products/setup && setup root v6_12_06a -q e17:prof && \
      cd /usr/local && git clone https://github.com/LArbys/LArCV.git larcv && cd /usr/local/larcv && \
      source configure.sh && make"

