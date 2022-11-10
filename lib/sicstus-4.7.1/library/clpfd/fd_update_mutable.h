
INLINE static void fd_update_mutable(Wam wam, TAGGED new_value, TAGGED mutable)
{
  TAGGED *h, *arg;
  
  arg = TagToArg(mutable,0);
  if (arg[2] < TrailToInt(w->node->trail_top) &&
      arg < w->global_uncond) {
    h = w->trail_top; /* trail mutable if need be */
    *h++ = mutable;
    *h++ = arg[1];
    *h++ = arg[2];
    arg[1] = new_value;	/* must come BEFORE sp_choice_overflow */
    arg[2] = TrailToInt(w->trail_top);
    w->trail_top = h;
    if ((TAGGED *)w->node-CHOICEPAD<w->trail_top)
      sp_choice_overflow(w,CHOICEPAD);
  } else
    arg[1] = new_value;
}
