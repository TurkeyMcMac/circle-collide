extern void jsAppendScore(int score);

extern void jsDrawCircle(float x, float y, float radius);

extern void jsDrawLine(float x1, float y1, float x2, float y2);

#if HAS_DEBUG_MODE == 1
extern void jsLogNum(int n);
#else
#	define jsLogNum(n)
#endif /* HAS_DEBUG_MODE == 1 */

extern void jsSetSave(unsigned addr, unsigned len);
