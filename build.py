#   -*- coding: utf-8 -*-
from pybuilder.core import use_plugin, init

use_plugin("python.core")
use_plugin("python.unittest")
use_plugin("python.flake8")
use_plugin("python.distutils")


name = "s4-loinc2hpo-msdw"
default_task = "publish"


@init
def set_properties(project):
    pass
