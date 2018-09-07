#ifndef _MCCamera
#define _MCCamera

#include "monkc_export.h"
#include "MC3DBase.h"
#include "MC3DNode.h"

typedef enum {
    MCCameraFixedAtOrigin = 0,
    MCCameraRotateAroundModelManual,
    MCCameraRotateAroundModelByGyroscope,
    MCCameraRotateAroundModelByGyroscopeReverse
} MCCameraRotateMode;

class(MCCamera, MC3DNode,
    double ratio;
    double depth_of_field;
    double field_of_view;
    //double max_distance;
    MCVector3 lookat;
    MCVector3 eye;
    MCVector3 up;

    //local spherical coordinate
    //R[0,unlimited) tht[0, 180.0), fai[0, 360.0)
    double R_value;
    double R_percent;
    double tht;
    double fai;
    
    computing(double, Radius);
    computing(MCMatrix3, normal);
    computing(MCMatrix4, viewMatrix);
    computing(MCMatrix4, projectionMatrix);
    computing(MCVector3, currentPosition);
    computing(MCMatrix3, rotationMat3);

    MCBool isReverseMovement;
    MCCameraRotateMode rotateMode;
);

fun(MCCamera, void, bye, voida);
fun(MCCamera, MCCamera*, initWithWidthHeight, unsigned width, unsigned height);

fun(MCCamera, void, transformWorld, MCMatrix4* mat4);
fun(MCCamera, void, transformSelf, MCMatrix4* mat4);
fun(MCCamera, void, transformSelfByEularAngle, MCVector3 lookat, double R, double fai, double tht);

fun(MCCamera, void, move, MCFloat deltaFai, MCFloat deltaTht);
fun(MCCamera, void, fucus, MCFloat deltaX, MCFloat deltaY);
fun(MCCamera, void, pull, MCFloat deltaR);
fun(MCCamera, void, reset, voida);
fun(MCCamera, void, distanceScale, MCFloat scale);
fun(MCCamera, void, setRotationMat3, float mat3[9]);
fun(MCCamera, void, printDebugInfo, voida);

fun(MCCamera, void, willDraw, MCMatrix4* projection, MCMatrix4* view, MCMatrix4* model);//override

#define MCLensStandard50mm (0.050)
#define MCLensWide24mm     (0.024)
#define MCLensLong100mm    (0.100)
#define MCLensLong200mm    (0.200)
#define MCLensLong2000mm   (2.000)
#define MCLensIphone29mm   (0.029)
#define MCLensIphone28mm   (0.028)

#define MCRatioCameraFilm3x2    (3.0/2.0)
#define MCRatioOldTV4x3         (4.0/3.0)
#define MCRatioHDTV16x9         (16.0/9.0)
#define MCRatioCinema239x100    (2.39/1.0)
#define MCRatioMake(w, h)       ((double)w / (double)h)

#define MCLensStandard50mmViewAngle (45.0)
#define MCLensIphone29mmViewAngle (73.44)
#define MCLensIphone28mmViewAngle (75.38)
#define MCLensIphoneVideoViewAngle (58.632149)
#endif
