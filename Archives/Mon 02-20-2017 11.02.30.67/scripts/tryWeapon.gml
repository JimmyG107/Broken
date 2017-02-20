if(use_tick <= 0)
{
    //set the number of bursts to do
    bursts = burst_max;
    //set the burst_tick to wait until the next burst
    burst_tick = burst_cd;
    //make this weapon wait some ticks before firing again
    use_tick = use_cd;
}
