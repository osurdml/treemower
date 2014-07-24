#include <stuntzhuntz.hpp>

StuntzHuntz::StuntzHuntz(CostMap *cm)
{
	this->cm = cm;
	update = &HuntStart;
}

int StuntzHuntz::HuntStart(std::vector<decision_t> decisions)
{
	return 0;
}

int StuntzHuntz::HuntRight(std::vector<decision_t> decisions)
{
	return 0;
}

int StuntzHuntz::HuntUp(std::vector<decision_t> decisions)
{
	return 0;
}


