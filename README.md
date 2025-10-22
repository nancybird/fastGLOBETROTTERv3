# fastGLOBETROTTERv3
fastGLOBETROTTER (Wangkumhang et al., 2022) with new features

R CMD SHLIB -o fastGLOBETROTTERCompanion.so fastGLOBETROTTERCompanion.c -lz -O2

Author: Garrett Hellenthal

# New features

1) Can fix minimum curve range (by setting e.g. 'curve.range: 1F 20' in param file). Previously minimum curve range could vary

2) Fixed version. Can set prop.ind: [0,1,0F,1F,0S,1S]. [0,1] used in previous fastGLOBETROTTER, but 1F and 1S activates new 'fixed' feature.

