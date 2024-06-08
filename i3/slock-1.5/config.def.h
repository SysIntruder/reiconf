/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nobody";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#14161b",     /* after initialization */
	[INPUT] =  "#004c73",   /* during input */
	[FAILED] = "#590008",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
