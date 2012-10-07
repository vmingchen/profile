# written by Aleksey Cheusov <vle@gmx.net>
# public domain

# basename -- return filename portion of pathname
function basename (pathname){
	sub(/^.*\//, "", pathname)
	return pathname
}

# written by Aleksey Cheusov <vle@gmx.net>
# public domain

# dirname -- return directory portion of pathname
function dirname (pathname){
        if (sub(/\/[^\/]*$/, "", pathname))
                return pathname
        else
                return "."
}

# bits2str --- turn a byte into readable 1's and 0's
function bits2str(bits,        data, mask)
{
	if (bits == 0)
		return "0"

	mask = 1
	for (; bits != 0; bits = rshift(bits, 1))
		data = (and(bits, mask) ? "1" : "0") data

	while ((length(data) % 8) != 0)
		data = "0" data

	return data
}

# m2hsize -- convert machine file size to human-readable file size
# styles:
#	0 -- K, M, G, T
#	1 -- B, KB, MB, GB, TB
function m2hsize(msize, istyle)
{
	styles[0] = ":K:M:G:T";
	styles[1] = "B:KB:MB:GB:TB";
	split(styles[istyle], units, ":");
	base = 1;
	tmp = msize;
	# index starts from 1
	for (i = 1; tmp >= 1024; ++i) {
		tmp = rshift(tmp, 10);
		base = lshift(base, 10);
	}
	return sprintf("%d%s", int(msize/base), units[i]);
}
