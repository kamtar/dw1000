#
# Makefile for RPi Tail DT eeproms
#

XTALT  ?= 0x0F
ANTD16 ?= 0x4020
ANTD64 ?= 0x4020
SPIMAX ?= 3000000

DTC = dtc

.PHONY: all tools program clean

all : dw_cutter_overlay.dtso

dw_cutter_overlay.dtso : dw_cutter_overlay.dtbo
	$(DTC) -@ -I dtb -O dts -o $@ $<

dw_cutter_overlay.dtbo : dw_cutter_overlay.dts Makefile
	$(CPP) -nostdinc -undef -x assembler-with-cpp \
		-DEUI64=0x$(firstword $(EUI64) $*)  -DSPIMAX=$(SPIMAX) \
		-DXTALT=$(XTALT) -DANTD16=$(ANTD16) -DANTD64=$(ANTD64) \
		$< | $(DTC) -Wno-unit_address_vs_reg -@ -I dts -O dtb -o $@

clean :
	$(RM) *.dtso *.dtbo
	$(MAKE) -C $(EEPROMUTILS) clean
