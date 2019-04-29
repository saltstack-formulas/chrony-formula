.. _readme:

chrony-formula
==============

|img_travis| |img_sr|

.. |img_travis| image:: https://travis-ci.com/saltstack-formulas/chrony-formula.svg?branch=master
   :alt: Travis CI Build Status
   :scale: 100%
   :target: https://travis-ci.com/saltstack-formulas/chrony-formula
.. |img_sr| image:: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
   :alt: Semantic Release
   :scale: 100%
   :target: https://github.com/semantic-release/semantic-release

Formula to set up and configure chrony

.. contents:: **Table of Contents**

General notes
-------------

See the full `SaltStack Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

If you are interested in writing or contributing to formulas, please pay attention to the `Writing Formula Section
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#writing-formulas>`_.

If you want to use this formula, please pay attention to the ``FORMULA`` file and/or ``git tag``,
which contains the currently released version. This formula is versioned according to `Semantic Versioning <http://semver.org/>`_.

See `Formula Versioning Section <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#versioning>`_ for more details.

Contributing to this repo
-------------------------

**Commit message formatting is significant!!**

Please see :ref:`How to contribute <CONTRIBUTING>` for more details.

Available states
----------------

.. contents::
    :local:

``chrony``
^^^^^^^^^^

*Meta-state (This is a state that includes other states)*.

This installs the chrony package,
manages the chrony configuration file and then
starts the associated chrony service.

``chrony.package``
^^^^^^^^^^^^^^^^^^

This state will install the chrony package only.

``chrony.config``
^^^^^^^^^^^^^^^^^

This state will configure the chrony service and has a dependency on ``chrony.install``
via include list.

``chrony.service``
^^^^^^^^^^^^^^^^^^

This state will start the chrony service and has a dependency on ``chrony.config``
via include list.

``chrony.clean``
^^^^^^^^^^^^^^^^

*Meta-state (This is a state that includes other states)*.

this state will undo everything performed in the ``chrony`` meta-state in reverse order, i.e.
stops the service,
removes the configuration file and
then uninstalls the package.

``chrony.service.clean``
^^^^^^^^^^^^^^^^^^^^^^^^

This state will stop the chrony service and disable it at boot time.

``chrony.config.clean``
^^^^^^^^^^^^^^^^^^^^^^^

This state will remove the configuration of the chrony service and has a
dependency on ``chrony.service.clean`` via include list.

``chrony.package.clean``
^^^^^^^^^^^^^^^^^^^^^^^^

This state will remove the chrony package and has a depency on
``chrony.config.clean`` via include list.
