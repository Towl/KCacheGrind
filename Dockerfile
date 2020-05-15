FROM archlinux/base

# Install ask-pass and a terminal 
RUN pacman --noconfirm -Sy  gnome-terminal kcachegrind graphviz libicui18n.so

RUN pacman --noconfirm -Syyu

# To allow the creation of windows
RUN dbus-uuidgen > /var/lib/dbus/machine-id

# Default value for the display
ENV DISPLAY=host.docker.internal:0

# To prevent warning from GTK
ENV NO_AT_BRIDGE=1

ENTRYPOINT ["bash"]

# Open virt-manager and a terminal then read for logs
CMD ["-c", "eval `dbus-launch --auto-syntax` gnome-terminal -x bash -c 'kcachegrind' && tail -f /var/log/*.log"]
