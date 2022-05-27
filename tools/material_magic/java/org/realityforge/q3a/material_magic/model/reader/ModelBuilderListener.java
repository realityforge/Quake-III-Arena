package org.realityforge.q3a.material_magic.model.reader;

import javax.annotation.Nonnull;
import org.realityforge.q3a.material_magic.model.CullType;
import org.realityforge.q3a.material_magic.model.Material;
import org.realityforge.q3a.material_magic.model.MaterialsUnit;
import org.realityforge.q3a.material_magic.model.Q3mapProperties;
import org.realityforge.q3a.material_magic.model.QerProperties;
import org.realityforge.q3a.material_magic.model.SurfaceProperty;

final class ModelBuilderListener extends MaterialsParserBaseListener {
    @Nonnull
    private final MaterialsUnit _unit = new MaterialsUnit();
    private Material _material;

    @Nonnull
    MaterialsUnit getUnit()
    {
        return _unit;
    }

    @Override
    public void enterMaterial(@Nonnull final MaterialsParser.MaterialContext ctx)
    {
        _material = new Material("");
    }

    @Override
    public void exitQ3mapMaterialProperty(@Nonnull final MaterialsParser.Q3mapMaterialPropertyContext ctx)
    {
        final Q3mapProperties q3map = _material.q3map();
        if (null != ctx.Q3MAP_SURFACELIGHT()) {
            q3map.setSurfaceLight(Integer.parseInt(ctx.POSITIVE_INTEGER().get(0).getText()));
        } else if (null != ctx.Q3MAP_LIGHTSUBDIVIDE()) {
            q3map.setLightSubDivide(Integer.parseInt(ctx.POSITIVE_INTEGER().get(0).getText()));
        } else if (null != ctx.Q3MAP_LIGHTIMAGE()) {
            q3map.setLightImage(ctx.LABEL().getText());
        } else if (null != ctx.Q3MAP_NOVERTEXSHADOWS()) {
            q3map.setNoVertexShadows(true);
        } else if (null != ctx.Q3MAP_GLOBALTEXTURE()) {
            q3map.setGlobalTexture(true);
        } else if (null != ctx.Q3MAP_FORCESUNLIGHT()) {
            q3map.setForceSunLight(true);
        } else if (null != ctx.Q3MAP_FLARE()) {
            q3map.setFlare(ctx.LABEL().getText());
        } else if (null != ctx.Q3MAP_BACKSPLASH()) {
            q3map.setBacksplashPercent(Integer.parseInt(ctx.POSITIVE_INTEGER().get(0).getText()));
            q3map.setBacksplashDistance(Integer.parseInt(ctx.POSITIVE_INTEGER().get(1).getText()));
        } else if (null != ctx.TESSSIZE()) {
            q3map.setTessSize(Integer.parseInt(ctx.POSITIVE_INTEGER().get(0).getText()));
        } else if (null != ctx.LIGHT()) {
            q3map.setFlare("flareshader");
        } else {
            throw new IllegalStateException("Unhandled q3map property " + ctx.getText());
        }
    }

    @Override
    public void exitCullDirective(@Nonnull final MaterialsParser.CullDirectiveContext ctx)
    {
        if (null != ctx.CULL_BACK() || null != ctx.CULL_BACKSIDE() || null != ctx.CULL_BACKSIDED()) {
            _material.setCull(CullType.BACK);
        } else if (null != ctx.CULL_DISABLE() || null != ctx.CULL_NONE() || null != ctx.CULL_TWOSIDED()) {
            _material.setCull(CullType.DISABLE);
        } else {
            throw new IllegalStateException("Unhandled cull value " + ctx.getText());
        }
    }

    @Override
    public void exitSurfaceParameterMaterialProperty(@Nonnull final MaterialsParser.SurfaceParameterMaterialPropertyContext ctx)
    {
        final String text = ctx.LABEL().getText().toLowerCase();
        SurfaceProperty surfaceProperty = null;
        for (final SurfaceProperty value : SurfaceProperty.values()) {
            if (value.name().equals(text)) {
                surfaceProperty = value;
                break;
            }
        }
        if (null == surfaceProperty) {
            throw new IllegalStateException("Unhandled surfaceParm value " + text);
        }
        _material.getSurfaceProperties().add(surfaceProperty);
    }

    @Override
    public void exitQerMaterialProperty(@Nonnull final MaterialsParser.QerMaterialPropertyContext ctx)
    {
        QerProperties qer = _material.qer();
        if (null != ctx.QER_TRANS()) {
            qer.setTransparency(Float.parseFloat(ctx.POSITIVE_DECIMAL().getText()));
        } else if (null != ctx.QER_EDITORIMAGE()) {
            qer.setEditorImage(ctx.LABEL().getText());
        } else if (null != ctx.QER_NOCARVE()) {
            qer.setNoCarve(true);
        } else {
            throw new IllegalStateException("Unhandled qer property " + ctx.getText());
        }
    }

    @Override
    public void exitMaterial(@Nonnull final MaterialsParser.MaterialContext ctx)
    {
        _material.setName(ctx.LABEL().getText());
        _unit.addMaterial(_material);
        _material = null;
    }
}
