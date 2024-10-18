#include <iostream>
#include <signal.h>

void handler(int sig)
{
    if (sig == SIGTERM)
    {
        std::cout << "SIGTERM\n";
        exit(EXIT_SUCCESS);
    }
}

int main(int argc, char const *argv[])
{
    signal(SIGTERM, handler);

    while (true)
    {
        /* code */
    }

    return 0;
}
