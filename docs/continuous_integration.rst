Continuous Integration and Deployment
=====================================

Continuous Integration (CI) and Deployment is achieved using
`CircleCI <https://circleci.com>`_.

Modifying the CI Setup
----------------------

While the project repository is most likely already set up to use with CircleCI,
The following instructions can be used to set up new projects. These
instructions are provided  as a supplement, not an alternative, to the
`CircleCI Documentation <https://circleci.com/docs>`_, detailing custom steps
for projects at Thrust Interactive. Please read the CircleCI documents to gain a
thorough understanding of CircleCI before attempting to modify this project's
configuration.

Finally, keep in mind that any sensitive data should be specified as environment
variables within the CircleCI Dashboard Project Settings, and not stored in the
code or build scripts that are saved in the repository.

Initial Project Setup
---------------------

The following steps should be done using the
`CircleCI Dashboard <https://circleci.com/dashboard>`_:

Getting Started
~~~~~~~~~~~~~~~

* Go to ``Add Projects``, navigate to the appropriate project, and click the
  ``Build project`` button.

  * Note that to stop building a project, all team members unfollow the project.

* Project specific settings can be accessed by navigating to the ``Builds``
  section and click the gear icon next to the project name.

* Within the project specific settings page:

  * *(Optionally)* Enable Slack integration under the ``Chat Notifications``
    section.

    * Paste the ``Webhook URL`` into the input box. (This is found in Slack's
      settings for the CircleCI App integration. Alternatively, since the same
      URL is used for all projects, you can copy it from another project.).
    * *(Optionally)* Select ``Override room?`` and specify a specific channel
      for the notifications. By default they all go to ``#dev_github``.

Unity Project Setup
~~~~~~~~~~~~~~~~~~~

* Within the project specific settings page:

  * Under ``Environment Variables``, add variables for ``UNITY_LICENSE_KEY``,
    ``UNITY_USERNAME``, ``UNITY_PASSWORD``. Their corresponding values can be
    obtained from ``LastPass``.

* Modify the ``circle.yml`` file, found in the root of the repository, to
  override testing, building and deployment commands, using the environment
  variables as needed to make Unity builds.
  * ***Always make sure to release the Unity License Key after the build phase
    is complete.***

iOS Project Setup
~~~~~~~~~~~~~~~~~

* Within the project specific settings page:

  * Under ``Build Environment``, set the ``Build OS X project`` to ``On``.

  * Under ``Environment Variables``, add a variable for ``XCODE_TEAM_ID``. This
    can be obtained from the `Apple Developer Portal > Membership Details
    <https://developer.apple.com/account/#/membership/>`_.

  * Under ``OS X Code Signing``:

    * Upload a code signing key (``.p12`` file) and enter the password. These
      can be obtained from ``LastPass``.

    * Upload a provisioning profile (``.mobileprovision`` file). This can be
      obtained from the `Apple Developer Portal
      <https://developer.apple.com/account>`_.
