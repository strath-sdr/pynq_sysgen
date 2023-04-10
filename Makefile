all: pynq_z1 pynq_z2

pynq_z1:
	$(MAKE) -C boards/Pynq-Z1/sobel/

pynq_z2:
	$(MAKE) -C boards/Pynq-Z2/audio_gain/
	$(MAKE) -C boards/Pynq-Z2/sobel/
