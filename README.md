# fastGLOBETROTTERv3
fastGLOBETROTTER (Wangkumhang et al., 2022) with new features

R CMD SHLIB -o fastGLOBETROTTERCompanion.so fastGLOBETROTTERCompanion.c -lz -O2

R < fastGLOBETROTTERv3.R parameter.infile.list samplefiles.infile.list recomratefiles.infile.list option --no-save > output.out

Author: Garrett Hellenthal

# New features

1) Can fix minimum curve range (by setting e.g. 'curve.range: 1F 20' in param file). Previously minimum curve range could vary

2) Fixed version. Can set prop.ind: [0,1,0F,1F,0S,1S]. [0,1] used in previous fastGLOBETROTTER, but 1F and 1S activates new 'fixed' feature.

These versions allow the user to 'fix' admixture sources. Create a fixed file in the format e.g. 

prop France Norway

0.25 0.5 0.5

prop Malawi Senegal

0.75 0.5 0.5

named the same as 'save.file.main:' in your paramfile, with postfix 'main.txt'. This will fix one source as France and Norway, and one as Malawi and Senegal, preventing the same population being used in both sources. 
