ARCHIVES=(
    #"tar xf",linux-2.6.32.71,https://cdn.kernel.org/pub/linux/kernel/v2.6/longterm/v2.6.32/linux-2.6.32.71.tar.xz
    #"tar xf",linux-3.4.111,https://cdn.kernel.org/pub/linux/kernel/v3.x/linux-3.4.111.tar.xz
    #"tar xf",linux-4.1.20,https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.1.20.tar.xz

    #linux-4.4.6,https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.4.6.tar.xz
    linux-4.5,https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.5.tar.xz
    #silesia,https://pstore.enkore.de/silesia.tar.xz
)

DOWNLOAD=$PWD/downloaded
EXTRACT=$PWD/extracted
ARENA=/tmp/borg-datatest-arena
REPO=$PWD/repository-$(borg -V | sed 's/^borg //')
RATELIMIT=inf

export BORG_PASSPHRASE=1234

echo Running on $(borg -V)
