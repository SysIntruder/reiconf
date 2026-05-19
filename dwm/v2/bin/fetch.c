#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/utsname.h>

#define MAX_LEN   256
#define ENV_USER  "USER"
#define ENV_SHELL "SHELL"

int main() {
  char
    user[MAX_LEN],
    hostname[MAX_LEN],
    kernel[MAX_LEN],
    distro[MAX_LEN],
    packages[MAX_LEN],
    totalpackages[MAX_LEN],
    wm[MAX_LEN],
    terminal[MAX_LEN],
    shell[MAX_LEN];
  struct utsname uts;
  FILE *fp;
  char *pshell;
  char cmd[MAX_LEN];
  int pid;


  strncpy(user, getenv(ENV_USER), sizeof(user) - 1);
  user[sizeof(user) - 1] = '\0';

  gethostname(hostname, sizeof(hostname));

  fp = popen(". /etc/os-release && printf '%s' \"$NAME\" | tr -d '\"'", "r");
  if (fp) {
    fgets(distro, sizeof(distro), fp);
    pclose(fp);
  }

  if (uname(&uts) == 0) {
    strncpy(kernel, uts.release, sizeof(kernel) - 1);
    kernel[sizeof(kernel) - 1] = '\0';
  }

  fp = popen("pacman -Qe | wc -l", "r");
  if (fp) {
    fgets(packages, sizeof(packages), fp);
    pclose(fp);
    packages[strcspn(packages, "\n")] = 0;
  }

  fp = popen("pacman -Q | wc -l", "r");
  if (fp) {
    fgets(totalpackages, sizeof(totalpackages), fp);
    pclose(fp);
    totalpackages[strcspn(totalpackages, "\n")] = 0;
  }

  fp = popen("xprop -root _NET_SUPPORTING_WM_CHECK 2>/dev/null | awk -F'#' '{print $2}' | xargs -r xprop -id 2>/dev/null | awk -F'\"' '/_NET_WM_NAME/ {print $2}'", "r");
  if (fp) {
    fgets(wm, sizeof(wm), fp);
    pclose(fp);
    wm[strcspn(wm, "\n")] = 0;
  }
  if (!strcmp(wm, "dwm")) {
    fp = popen("dwm -v 2>&1", "r");
    if (fp) {
      fgets(wm, sizeof(wm), fp);
      pclose(fp);
      wm[strcspn(wm, "\n")] = 0;
    }
  }

  pid = getpid();
  for (int i = 0; i < 2; i++) {
    snprintf(cmd, sizeof(cmd), "ps -p %d -o ppid=", pid);
    fp = popen(cmd, "r");
    if (fp) {
      fscanf(fp, "%d", &pid);
      pclose(fp);
    }
  }
  snprintf(cmd, sizeof(cmd), "ps -p %d -o args=", pid);
  fp = popen(cmd, "r");
  if (fp) {
    fgets(terminal, sizeof(terminal), fp);
    pclose(fp);
    terminal[strcspn(terminal, " ")] = 0;

    if (!strcmp(terminal, "st")) {
      fp = popen("st -v 2>&1", "r");
      if (fp) {
        fgets(terminal, sizeof(terminal), fp);
        pclose(fp);
        terminal[strcspn(terminal, "\n")] = 0;
      }
    }
    if (!strcmp(terminal, "tmux")) {
      fp = popen("tmux -V", "r");
      if (fp) {
        fgets(terminal, sizeof(terminal), fp);
        pclose(fp);
        terminal[strcspn(terminal, "\n")] = 0;
      }
    }
  }

  pshell = getenv(ENV_SHELL);
  if (pshell) {
    pshell = strrchr(pshell, '/');
    snprintf(shell, sizeof(shell), "%s", pshell ? pshell + 1 : getenv(ENV_SHELL));
  }
  if (!strcmp(shell, "bash")) {
    fp = popen("bash --version | head -n1 | awk '{gsub(/,/, \"\", $2); print $2, $4}'", "r");
    if (fp) {
      fgets(shell, sizeof(shell), fp);
      pclose(fp);
      shell[strcspn(shell, "\n")] = 0;
    }
  }

  printf("%s@%s\n", user, hostname);
  printf("======================================\n");
  printf("DISTRO         : %s\n", distro);
  printf("KERNEL         : %s\n", kernel);
  printf("PACKAGES       : %s (%s)\n", packages, totalpackages);
  printf("WINDOW MANAGER : %s\n", wm);
  printf("TERMINAL       : %s\n", terminal);
  printf("SHELL          : %s\n", shell);
  printf("======================================\n");
  for(int i = 40; i <= 47; i++) {
    printf("\033[%dm   \033[0m", i);
  }
  printf("\n");
  for(int i = 100; i <= 107; i++) {
    printf("\033[%dm   \033[0m", i);
  }
  printf("\n");

  return 0;
}
