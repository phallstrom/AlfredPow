EXTENSION = Pow.alfredworkflow
BUNDLEID = pjkh.pow
VERSION = 1.0
SOURCE_FILES = pow.sh functions.sh icon.png info.plist
PKG_FILES = $(SOURCE_FILES)

WORKFLOW_DIR = $(HOME)/Library/Application Support/Alfred 2/Alfred.alfredpreferences/workflows
INSTALL_DIR = `grep -l -- ">$(BUNDLEID)<" "$(WORKFLOW_DIR)"/*/info.plist | sed 's/\/info.plist//'`

all: $(EXTENSION)

$(EXTENSION): $(SOURCE_FILES) VERSION
	zip -rT $(EXTENSION) $(PKG_FILES)

VERSION:
	touch info.plist

clean:
	rm -rf $(EXTENSION)

test:
	@roundup tests/test_*

local-install:
	[[ -d "$(INSTALL_DIR)" ]] && cp -r $(PKG_FILES) "$(INSTALL_DIR)/"
