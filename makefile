ARMAKE2			:= armake2

ifdef PRODUCTION
	COMMAND		:= build
	FLAGS		:= -i include -w unquoted-string -w redefinition-wo-undef -w non-windows-binarization
else
	COMMAND		:= pack
	FLAGS		:=
endif

PBOPREFIX		:= \$$PBOPREFIX\$$
BS				:= $(strip \\\ )
findall			= $(shell find addons/$(strip $(1)) $(strip $(2)))
sources			= $(call findall, $(1), -iname '*.sqf' -o -iname '*.hpp' -o -iname '*.cpp')
macros			= addons/$(strip $(1))/macros.hpp
finddefine		= $(shell cat $(call macros, $(1)) | grep -E "^\s*\#define\s+$(strip $(2))\s+" | awk '{print $$3}')

AUTHOR			:= $(call finddefine, shared, AUTHOR)
MOD				:= $(call finddefine, shared, MOD)
OUT				:= @$(or $(MOD), out)

all: $(patsubst addons/%, $(OUT)/addons/%.pbo, $(wildcard addons/*))

signatures: $(patsubst addons/%, $(OUT)/addons/%.pbo.bisign, $(wildcard addons/*))

production: clean
	$(MAKE) $(MAKEFLAGS) PRODUCTION= signatures

clean:
	rm -rf $(OUT)

addons/%/$(PBOPREFIX): addons/%
	@echo "$(PBOPREFIX) $<"
	@printf "%s\\%s\\%s" $(AUTHOR) $(MOD) $(call finddefine, $(<F), COMPONENT) > $@

$(OUT)/addons/%.pbo.bisign: $(OUT)/addons/%.pbo
	@echo "sign $<"
	@$(ARMAKE2) sign -f $(KEY) $< $@

.SECONDEXPANSION:
$(OUT)/addons/%.pbo: addons/% addons/%/$$(PBOPREFIX) $$(call sources, %)
	@mkdir -p $(OUT)/addons
	@echo "$(COMMAND) $<"
	@$(ARMAKE2) $(COMMAND) -f $(FLAGS) $< $@

.PHONY: all signatures clean production
