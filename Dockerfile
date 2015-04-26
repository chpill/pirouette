FROM adzerk/boot-clj

# The purpose of this dockerfile is to give a generic environment for front-end
# work with clojure. Deployment of the app should be done in another image.


ENV BOOT_LOCAL_REPO /m2
RUN mkdir /m2

ENV BOOT_CHANNEL DEV
RUN boot -u

COPY build.boot build.boot
# This will cache the project dependencies in the image.
# It actually runs every the dev task (exept watch, as it would block) so that
# the dependencies of the tasks are also fetched.
RUN boot fetch-dependencies
