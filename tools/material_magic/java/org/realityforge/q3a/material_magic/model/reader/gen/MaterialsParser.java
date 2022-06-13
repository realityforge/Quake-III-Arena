// Generated from
// /Users/peter/Code/GameDev/Quake-III-Arena/tools/material_magic/java/org/realityforge/q3a/material_magic/model/reader/MaterialsParser.g4
// by ANTLR 4.10.1
import java.util.List;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;

@SuppressWarnings( { "all", "warnings", "unchecked", "unused", "cast" } )
public class MaterialsParser extends Parser
{
  static { RuntimeMetaData.checkVersion( "4.10.1", RuntimeMetaData.VERSION ); }

  protected static final DFA[] _decisionToDFA;
  protected static final PredictionContextCache _sharedContextCache = new PredictionContextCache();
  public static final int OPEN_BRACE = 1, CLOSE_BRACE = 2, OPEN_BRACKET = 3, CLOSE_BRACKET = 4, DASH = 5, CULL = 6,
                          CULL_DISABLE = 7, CULL_NONE = 8, CULL_TWOSIDED = 9, CULL_BACK = 10, CULL_BACKSIDE = 11,
                          CULL_BACKSIDED = 12, NOPICMIP = 13, NOMIPMAPS = 14, PORTAL = 15, ENTITYMERGABLE = 16,
                          FOGPARMS = 17, SKYPARMS = 18, POLYGONOFFSET = 19, DEFORMVERTEXES = 20, WAVE = 21, NORMAL = 22,
                          MOVE = 23, BULGE = 24, PROJECTIONSHADOW = 25, AUTOSPRITE = 26, AUTOSPRITE2 = 27, TEXT0 = 28,
                          TEXT1 = 29, TEXT2 = 30, TEXT3 = 31, TEXT4 = 32, TEXT5 = 33, TEXT6 = 34, TEXT7 = 35, SORT = 36,
                          Q3MAP_LIGHTIMAGE = 37, Q3MAP_GLOBALTEXTURE = 38, Q3MAP_SURFACELIGHT = 39,
                          Q3MAP_NOVERTEXSHADOWS = 40, Q3MAP_FORCESUNLIGHT = 41, Q3MAP_LIGHTSUBDIVIDE = 42,
                          Q3MAP_BACKSPLASH = 43, Q3MAP_SUN = 44, TESSSIZE = 45, Q3MAP_FLARE = 46, LIGHT = 47,
                          QER_EDITORIMAGE = 48, QER_NOCARVE = 49, QER_TRANS = 50, SURFACE_PARM = 51, INTEGER = 52,
                          DECIMAL = 53, LABEL = 54, WHITESPACE = 55, COMMENT = 56;
  public static final int RULE_unit = 0, RULE_materials = 1, RULE_documentation = 2, RULE_material = 3,
                          RULE_directives = 4, RULE_directive = 5, RULE_generalDirective = 6, RULE_cullDirective = 7,
                          RULE_noPicMipDirective = 8, RULE_noMipMapsDirective = 9, RULE_portalDirective = 10,
                          RULE_entityMergableDirective = 11, RULE_fogParmsDirective = 12, RULE_skyParmsDirective = 13,
                          RULE_polygonOffsetDirective = 14, RULE_sortDirective = 15, RULE_waveFunc = 16,
                          RULE_normalFunc = 17, RULE_moveFunc = 18, RULE_bulgeFunc = 19, RULE_projectionShadowFunc = 20,
                          RULE_autoSpriteFunc = 21, RULE_autoSprite2Func = 22, RULE_textFunc = 23, RULE_func = 24,
                          RULE_deformVertexesDirective = 25, RULE_surfaceParameterDirective = 26,
                          RULE_q3mapDirective = 27, RULE_number = 28, RULE_q3mapSurfaceLightDirective = 29,
                          RULE_q3mapGlobalTextureDirective = 30, RULE_q3mapSunDirective = 31,
                          RULE_q3mapLightImageDirective = 32, RULE_q3mapNoVertexShadowsDirective = 33,
                          RULE_q3mapForceSunlightDirective = 34, RULE_q3mapFlareDirective = 35,
                          RULE_q3mapLightSubdivideDirective = 36, RULE_q3mapTessSizeDirective = 37,
                          RULE_q3mapBackSplashDirective = 38, RULE_q3mapLightDirective = 39, RULE_qerDirective = 40,
                          RULE_qerEditorImageDirective = 41, RULE_qerNoCarveDirective = 42, RULE_qerTransDirective = 43;

  private static String[] makeRuleNames()
  {
    return new String[] { "unit",
                          "materials",
                          "documentation",
                          "material",
                          "directives",
                          "directive",
                          "generalDirective",
                          "cullDirective",
                          "noPicMipDirective",
                          "noMipMapsDirective",
                          "portalDirective",
                          "entityMergableDirective",
                          "fogParmsDirective",
                          "skyParmsDirective",
                          "polygonOffsetDirective",
                          "sortDirective",
                          "waveFunc",
                          "normalFunc",
                          "moveFunc",
                          "bulgeFunc",
                          "projectionShadowFunc",
                          "autoSpriteFunc",
                          "autoSprite2Func",
                          "textFunc",
                          "func",
                          "deformVertexesDirective",
                          "surfaceParameterDirective",
                          "q3mapDirective",
                          "number",
                          "q3mapSurfaceLightDirective",
                          "q3mapGlobalTextureDirective",
                          "q3mapSunDirective",
                          "q3mapLightImageDirective",
                          "q3mapNoVertexShadowsDirective",
                          "q3mapForceSunlightDirective",
                          "q3mapFlareDirective",
                          "q3mapLightSubdivideDirective",
                          "q3mapTessSizeDirective",
                          "q3mapBackSplashDirective",
                          "q3mapLightDirective",
                          "qerDirective",
                          "qerEditorImageDirective",
                          "qerNoCarveDirective",
                          "qerTransDirective" };
  }

  public static final String[] ruleNames = makeRuleNames();

  private static String[] makeLiteralNames()
  {
    return new String[] { null, "'{'", "'}'", "'('", "')'", "'-'", "'cull'" };
  }

  private static final String[] _LITERAL_NAMES = makeLiteralNames();

  private static String[] makeSymbolicNames()
  {
    return new String[] { null,
                          "OPEN_BRACE",
                          "CLOSE_BRACE",
                          "OPEN_BRACKET",
                          "CLOSE_BRACKET",
                          "DASH",
                          "CULL",
                          "CULL_DISABLE",
                          "CULL_NONE",
                          "CULL_TWOSIDED",
                          "CULL_BACK",
                          "CULL_BACKSIDE",
                          "CULL_BACKSIDED",
                          "NOPICMIP",
                          "NOMIPMAPS",
                          "PORTAL",
                          "ENTITYMERGABLE",
                          "FOGPARMS",
                          "SKYPARMS",
                          "POLYGONOFFSET",
                          "DEFORMVERTEXES",
                          "WAVE",
                          "NORMAL",
                          "MOVE",
                          "BULGE",
                          "PROJECTIONSHADOW",
                          "AUTOSPRITE",
                          "AUTOSPRITE2",
                          "TEXT0",
                          "TEXT1",
                          "TEXT2",
                          "TEXT3",
                          "TEXT4",
                          "TEXT5",
                          "TEXT6",
                          "TEXT7",
                          "SORT",
                          "Q3MAP_LIGHTIMAGE",
                          "Q3MAP_GLOBALTEXTURE",
                          "Q3MAP_SURFACELIGHT",
                          "Q3MAP_NOVERTEXSHADOWS",
                          "Q3MAP_FORCESUNLIGHT",
                          "Q3MAP_LIGHTSUBDIVIDE",
                          "Q3MAP_BACKSPLASH",
                          "Q3MAP_SUN",
                          "TESSSIZE",
                          "Q3MAP_FLARE",
                          "LIGHT",
                          "QER_EDITORIMAGE",
                          "QER_NOCARVE",
                          "QER_TRANS",
                          "SURFACE_PARM",
                          "INTEGER",
                          "DECIMAL",
                          "LABEL",
                          "WHITESPACE",
                          "COMMENT" };
  }

  private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
  public static final Vocabulary VOCABULARY = new VocabularyImpl( _LITERAL_NAMES, _SYMBOLIC_NAMES );

  /**
   * @deprecated Use {@link #VOCABULARY} instead.
   */
  @Deprecated
  public static final String[] tokenNames;

  static
  {
    tokenNames = new String[_SYMBOLIC_NAMES.length];
    for ( int i = 0; i < tokenNames.length; i++ ) {
      tokenNames[i] = VOCABULARY.getLiteralName( i );
      if ( tokenNames[i] == null ) {
        tokenNames[i] = VOCABULARY.getSymbolicName( i );
      }

      if ( tokenNames[i] == null ) {
        tokenNames[i] = "<INVALID>";
      }
    }
  }

  @Override
  @Deprecated
  public String[] getTokenNames()
  {
    return tokenNames;
  }

  @Override
  public Vocabulary getVocabulary()
  {
    return VOCABULARY;
  }

  @Override
  public String getGrammarFileName()
  {
    return "MaterialsParser.g4";
  }

  @Override
  public String[] getRuleNames()
  {
    return ruleNames;
  }

  @Override
  public String getSerializedATN()
  {
    return _serializedATN;
  }

  @Override
  public ATN getATN()
  {
    return _ATN;
  }

  public MaterialsParser( TokenStream input )
  {
    super( input );
    _interp = new ParserATNSimulator( this, _ATN, _decisionToDFA, _sharedContextCache );
  }

  public static class UnitContext extends ParserRuleContext
  {
    public MaterialsContext materials() { return getRuleContext( MaterialsContext.class, 0 ); }

    public TerminalNode EOF() { return getToken( MaterialsParser.EOF, 0 ); }

    public UnitContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_unit;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterUnit( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitUnit( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitUnit( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final UnitContext unit() throws RecognitionException
  {
    UnitContext _localctx = new UnitContext( _ctx, getState() );
    enterRule( _localctx, 0, RULE_unit );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 88 );
        materials();
        setState( 89 );
        match( EOF );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class MaterialsContext extends ParserRuleContext
  {
    public DocumentationContext documentation() { return getRuleContext( DocumentationContext.class, 0 ); }

    public MaterialContext material() { return getRuleContext( MaterialContext.class, 0 ); }

    public MaterialsContext materials() { return getRuleContext( MaterialsContext.class, 0 ); }

    public MaterialsContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_materials;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterMaterials( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitMaterials( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitMaterials( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final MaterialsContext materials() throws RecognitionException
  {
    MaterialsContext _localctx = new MaterialsContext( _ctx, getState() );
    enterRule( _localctx, 2, RULE_materials );
    try {
      setState( 96 );
      _errHandler.sync( this );
      switch ( _input.LA( 1 ) ) {
        case LABEL:
        case COMMENT:
          enterOuterAlt( _localctx, 1 );
          {
            setState( 91 );
            documentation();
            setState( 92 );
            material();
            setState( 93 );
            materials();
          }
          break;
        case EOF:
          enterOuterAlt( _localctx, 2 );
          {
          }
          break;
        default:
          throw new NoViableAltException( this );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class DocumentationContext extends ParserRuleContext
  {
    public List<TerminalNode> COMMENT() { return getTokens( MaterialsParser.COMMENT ); }

    public TerminalNode COMMENT( int i ) { return getToken( MaterialsParser.COMMENT, i ); }

    public DocumentationContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_documentation;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterDocumentation( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitDocumentation( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitDocumentation( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final DocumentationContext documentation() throws RecognitionException
  {
    DocumentationContext _localctx = new DocumentationContext( _ctx, getState() );
    enterRule( _localctx, 4, RULE_documentation );
    int _la;
    try {
      setState( 105 );
      _errHandler.sync( this );
      switch ( getInterpreter().adaptivePredict( _input, 2, _ctx ) ) {
        case 1:
          enterOuterAlt( _localctx, 1 );
          {
            setState( 101 );
            _errHandler.sync( this );
            _la = _input.LA( 1 );
            while ( _la == COMMENT ) {
              {
                {
                  setState( 98 );
                  match( COMMENT );
                }
              }
              setState( 103 );
              _errHandler.sync( this );
              _la = _input.LA( 1 );
            }
          }
          break;
        case 2:
          enterOuterAlt( _localctx, 2 );
          {
          }
          break;
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class MaterialContext extends ParserRuleContext
  {
    public TerminalNode LABEL() { return getToken( MaterialsParser.LABEL, 0 ); }

    public TerminalNode OPEN_BRACE() { return getToken( MaterialsParser.OPEN_BRACE, 0 ); }

    public DirectivesContext directives() { return getRuleContext( DirectivesContext.class, 0 ); }

    public TerminalNode CLOSE_BRACE() { return getToken( MaterialsParser.CLOSE_BRACE, 0 ); }

    public MaterialContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_material;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterMaterial( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitMaterial( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitMaterial( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final MaterialContext material() throws RecognitionException
  {
    MaterialContext _localctx = new MaterialContext( _ctx, getState() );
    enterRule( _localctx, 6, RULE_material );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 107 );
        match( LABEL );
        setState( 108 );
        match( OPEN_BRACE );
        setState( 109 );
        directives();
        setState( 110 );
        match( CLOSE_BRACE );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class DirectivesContext extends ParserRuleContext
  {
    public DirectiveContext directive() { return getRuleContext( DirectiveContext.class, 0 ); }

    public DirectivesContext directives() { return getRuleContext( DirectivesContext.class, 0 ); }

    public DirectivesContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_directives;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterDirectives( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitDirectives( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitDirectives( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final DirectivesContext directives() throws RecognitionException
  {
    DirectivesContext _localctx = new DirectivesContext( _ctx, getState() );
    enterRule( _localctx, 8, RULE_directives );
    try {
      setState( 116 );
      _errHandler.sync( this );
      switch ( _input.LA( 1 ) ) {
        case CULL:
        case NOPICMIP:
        case NOMIPMAPS:
        case PORTAL:
        case ENTITYMERGABLE:
        case FOGPARMS:
        case SKYPARMS:
        case POLYGONOFFSET:
        case DEFORMVERTEXES:
        case SORT:
        case Q3MAP_LIGHTIMAGE:
        case Q3MAP_GLOBALTEXTURE:
        case Q3MAP_SURFACELIGHT:
        case Q3MAP_NOVERTEXSHADOWS:
        case Q3MAP_FORCESUNLIGHT:
        case Q3MAP_LIGHTSUBDIVIDE:
        case Q3MAP_BACKSPLASH:
        case Q3MAP_SUN:
        case TESSSIZE:
        case Q3MAP_FLARE:
        case LIGHT:
        case QER_EDITORIMAGE:
        case QER_NOCARVE:
        case QER_TRANS:
        case SURFACE_PARM:
          enterOuterAlt( _localctx, 1 );
          {
            setState( 112 );
            directive();
            setState( 113 );
            directives();
          }
          break;
        case CLOSE_BRACE:
          enterOuterAlt( _localctx, 2 );
          {
          }
          break;
        default:
          throw new NoViableAltException( this );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class DirectiveContext extends ParserRuleContext
  {
    public GeneralDirectiveContext generalDirective() { return getRuleContext( GeneralDirectiveContext.class, 0 ); }

    public Q3mapDirectiveContext q3mapDirective() { return getRuleContext( Q3mapDirectiveContext.class, 0 ); }

    public SurfaceParameterDirectiveContext surfaceParameterDirective()
    {
      return getRuleContext( SurfaceParameterDirectiveContext.class, 0 );
    }

    public QerDirectiveContext qerDirective() { return getRuleContext( QerDirectiveContext.class, 0 ); }

    public DirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_directive;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final DirectiveContext directive() throws RecognitionException
  {
    DirectiveContext _localctx = new DirectiveContext( _ctx, getState() );
    enterRule( _localctx, 10, RULE_directive );
    try {
      setState( 122 );
      _errHandler.sync( this );
      switch ( _input.LA( 1 ) ) {
        case CULL:
        case NOPICMIP:
        case NOMIPMAPS:
        case PORTAL:
        case ENTITYMERGABLE:
        case FOGPARMS:
        case SKYPARMS:
        case POLYGONOFFSET:
        case DEFORMVERTEXES:
        case SORT:
          enterOuterAlt( _localctx, 1 );
          {
            setState( 118 );
            generalDirective();
          }
          break;
        case Q3MAP_LIGHTIMAGE:
        case Q3MAP_GLOBALTEXTURE:
        case Q3MAP_SURFACELIGHT:
        case Q3MAP_NOVERTEXSHADOWS:
        case Q3MAP_FORCESUNLIGHT:
        case Q3MAP_LIGHTSUBDIVIDE:
        case Q3MAP_BACKSPLASH:
        case Q3MAP_SUN:
        case TESSSIZE:
        case Q3MAP_FLARE:
        case LIGHT:
          enterOuterAlt( _localctx, 2 );
          {
            setState( 119 );
            q3mapDirective();
          }
          break;
        case SURFACE_PARM:
          enterOuterAlt( _localctx, 3 );
          {
            setState( 120 );
            surfaceParameterDirective();
          }
          break;
        case QER_EDITORIMAGE:
        case QER_NOCARVE:
        case QER_TRANS:
          enterOuterAlt( _localctx, 4 );
          {
            setState( 121 );
            qerDirective();
          }
          break;
        default:
          throw new NoViableAltException( this );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class GeneralDirectiveContext extends ParserRuleContext
  {
    public CullDirectiveContext cullDirective() { return getRuleContext( CullDirectiveContext.class, 0 ); }

    public NoPicMipDirectiveContext noPicMipDirective() { return getRuleContext( NoPicMipDirectiveContext.class, 0 ); }

    public NoMipMapsDirectiveContext noMipMapsDirective()
    {
      return getRuleContext( NoMipMapsDirectiveContext.class, 0 );
    }

    public PortalDirectiveContext portalDirective() { return getRuleContext( PortalDirectiveContext.class, 0 ); }

    public EntityMergableDirectiveContext entityMergableDirective()
    {
      return getRuleContext( EntityMergableDirectiveContext.class, 0 );
    }

    public FogParmsDirectiveContext fogParmsDirective() { return getRuleContext( FogParmsDirectiveContext.class, 0 ); }

    public SkyParmsDirectiveContext skyParmsDirective() { return getRuleContext( SkyParmsDirectiveContext.class, 0 ); }

    public PolygonOffsetDirectiveContext polygonOffsetDirective()
    {
      return getRuleContext( PolygonOffsetDirectiveContext.class, 0 );
    }

    public SortDirectiveContext sortDirective() { return getRuleContext( SortDirectiveContext.class, 0 ); }

    public DeformVertexesDirectiveContext deformVertexesDirective()
    {
      return getRuleContext( DeformVertexesDirectiveContext.class, 0 );
    }

    public GeneralDirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_generalDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterGeneralDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitGeneralDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitGeneralDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final GeneralDirectiveContext generalDirective() throws RecognitionException
  {
    GeneralDirectiveContext _localctx = new GeneralDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 12, RULE_generalDirective );
    try {
      setState( 134 );
      _errHandler.sync( this );
      switch ( _input.LA( 1 ) ) {
        case CULL:
          enterOuterAlt( _localctx, 1 );
          {
            setState( 124 );
            cullDirective();
          }
          break;
        case NOPICMIP:
          enterOuterAlt( _localctx, 2 );
          {
            setState( 125 );
            noPicMipDirective();
          }
          break;
        case NOMIPMAPS:
          enterOuterAlt( _localctx, 3 );
          {
            setState( 126 );
            noMipMapsDirective();
          }
          break;
        case PORTAL:
          enterOuterAlt( _localctx, 4 );
          {
            setState( 127 );
            portalDirective();
          }
          break;
        case ENTITYMERGABLE:
          enterOuterAlt( _localctx, 5 );
          {
            setState( 128 );
            entityMergableDirective();
          }
          break;
        case FOGPARMS:
          enterOuterAlt( _localctx, 6 );
          {
            setState( 129 );
            fogParmsDirective();
          }
          break;
        case SKYPARMS:
          enterOuterAlt( _localctx, 7 );
          {
            setState( 130 );
            skyParmsDirective();
          }
          break;
        case POLYGONOFFSET:
          enterOuterAlt( _localctx, 8 );
          {
            setState( 131 );
            polygonOffsetDirective();
          }
          break;
        case SORT:
          enterOuterAlt( _localctx, 9 );
          {
            setState( 132 );
            sortDirective();
          }
          break;
        case DEFORMVERTEXES:
          enterOuterAlt( _localctx, 10 );
          {
            setState( 133 );
            deformVertexesDirective();
          }
          break;
        default:
          throw new NoViableAltException( this );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class CullDirectiveContext extends ParserRuleContext
  {
    public TerminalNode CULL() { return getToken( MaterialsParser.CULL, 0 ); }

    public TerminalNode CULL_DISABLE() { return getToken( MaterialsParser.CULL_DISABLE, 0 ); }

    public TerminalNode CULL_NONE() { return getToken( MaterialsParser.CULL_NONE, 0 ); }

    public TerminalNode CULL_TWOSIDED() { return getToken( MaterialsParser.CULL_TWOSIDED, 0 ); }

    public TerminalNode CULL_BACK() { return getToken( MaterialsParser.CULL_BACK, 0 ); }

    public TerminalNode CULL_BACKSIDE() { return getToken( MaterialsParser.CULL_BACKSIDE, 0 ); }

    public TerminalNode CULL_BACKSIDED() { return getToken( MaterialsParser.CULL_BACKSIDED, 0 ); }

    public CullDirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_cullDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterCullDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitCullDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitCullDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final CullDirectiveContext cullDirective() throws RecognitionException
  {
    CullDirectiveContext _localctx = new CullDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 14, RULE_cullDirective );
    int _la;
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 136 );
        match( CULL );
        setState( 137 );
        _la = _input.LA( 1 );
        if ( !( ( ( ( _la ) & ~0x3f ) == 0 &&
                  ( ( 1L << _la ) & ( ( 1L << CULL_DISABLE ) | ( 1L << CULL_NONE ) | ( 1L << CULL_TWOSIDED ) |
                                      ( 1L << CULL_BACK ) | ( 1L << CULL_BACKSIDE ) | ( 1L << CULL_BACKSIDED ) ) ) !=
                    0 ) ) ) {
          _errHandler.recoverInline( this );
        } else {
          if ( _input.LA( 1 ) == Token.EOF )
            matchedEOF = true;
          _errHandler.reportMatch( this );
          consume();
        }
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class NoPicMipDirectiveContext extends ParserRuleContext
  {
    public TerminalNode NOPICMIP() { return getToken( MaterialsParser.NOPICMIP, 0 ); }

    public NoPicMipDirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_noPicMipDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterNoPicMipDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitNoPicMipDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitNoPicMipDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final NoPicMipDirectiveContext noPicMipDirective() throws RecognitionException
  {
    NoPicMipDirectiveContext _localctx = new NoPicMipDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 16, RULE_noPicMipDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 139 );
        match( NOPICMIP );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class NoMipMapsDirectiveContext extends ParserRuleContext
  {
    public TerminalNode NOMIPMAPS() { return getToken( MaterialsParser.NOMIPMAPS, 0 ); }

    public NoMipMapsDirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_noMipMapsDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterNoMipMapsDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitNoMipMapsDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitNoMipMapsDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final NoMipMapsDirectiveContext noMipMapsDirective() throws RecognitionException
  {
    NoMipMapsDirectiveContext _localctx = new NoMipMapsDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 18, RULE_noMipMapsDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 141 );
        match( NOMIPMAPS );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class PortalDirectiveContext extends ParserRuleContext
  {
    public TerminalNode PORTAL() { return getToken( MaterialsParser.PORTAL, 0 ); }

    public PortalDirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_portalDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterPortalDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitPortalDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitPortalDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final PortalDirectiveContext portalDirective() throws RecognitionException
  {
    PortalDirectiveContext _localctx = new PortalDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 20, RULE_portalDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 143 );
        match( PORTAL );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class EntityMergableDirectiveContext extends ParserRuleContext
  {
    public TerminalNode ENTITYMERGABLE() { return getToken( MaterialsParser.ENTITYMERGABLE, 0 ); }

    public EntityMergableDirectiveContext( ParserRuleContext parent, int invokingState )
    {
      super( parent, invokingState );
    }

    @Override
    public int getRuleIndex()
    {
      return RULE_entityMergableDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterEntityMergableDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitEntityMergableDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitEntityMergableDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final EntityMergableDirectiveContext entityMergableDirective() throws RecognitionException
  {
    EntityMergableDirectiveContext _localctx = new EntityMergableDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 22, RULE_entityMergableDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 145 );
        match( ENTITYMERGABLE );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class FogParmsDirectiveContext extends ParserRuleContext
  {
    public TerminalNode FOGPARMS() { return getToken( MaterialsParser.FOGPARMS, 0 ); }

    public List<NumberContext> number() { return getRuleContexts( NumberContext.class ); }

    public NumberContext number( int i ) { return getRuleContext( NumberContext.class, i ); }

    public TerminalNode OPEN_BRACKET() { return getToken( MaterialsParser.OPEN_BRACKET, 0 ); }

    public TerminalNode CLOSE_BRACKET() { return getToken( MaterialsParser.CLOSE_BRACKET, 0 ); }

    public FogParmsDirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_fogParmsDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterFogParmsDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitFogParmsDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitFogParmsDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final FogParmsDirectiveContext fogParmsDirective() throws RecognitionException
  {
    FogParmsDirectiveContext _localctx = new FogParmsDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 24, RULE_fogParmsDirective );
    int _la;
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 147 );
        match( FOGPARMS );
        setState( 149 );
        _errHandler.sync( this );
        _la = _input.LA( 1 );
        if ( _la == OPEN_BRACKET ) {
          {
            setState( 148 );
            match( OPEN_BRACKET );
          }
        }

        setState( 151 );
        number();
        setState( 152 );
        number();
        setState( 153 );
        number();
        setState( 155 );
        _errHandler.sync( this );
        _la = _input.LA( 1 );
        if ( _la == CLOSE_BRACKET ) {
          {
            setState( 154 );
            match( CLOSE_BRACKET );
          }
        }

        setState( 157 );
        number();
        setState( 159 );
        _errHandler.sync( this );
        switch ( getInterpreter().adaptivePredict( _input, 8, _ctx ) ) {
          case 1: {
            setState( 158 );
            number();
          } break;
        }
        setState( 162 );
        _errHandler.sync( this );
        _la = _input.LA( 1 );
        if ( _la == INTEGER || _la == DECIMAL ) {
          {
            setState( 161 );
            number();
          }
        }
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class SkyParmsDirectiveContext extends ParserRuleContext
  {
    public TerminalNode SKYPARMS() { return getToken( MaterialsParser.SKYPARMS, 0 ); }

    public List<TerminalNode> DASH() { return getTokens( MaterialsParser.DASH ); }

    public TerminalNode DASH( int i ) { return getToken( MaterialsParser.DASH, i ); }

    public List<TerminalNode> LABEL() { return getTokens( MaterialsParser.LABEL ); }

    public TerminalNode LABEL( int i ) { return getToken( MaterialsParser.LABEL, i ); }

    public TerminalNode INTEGER() { return getToken( MaterialsParser.INTEGER, 0 ); }

    public SkyParmsDirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_skyParmsDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterSkyParmsDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitSkyParmsDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitSkyParmsDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final SkyParmsDirectiveContext skyParmsDirective() throws RecognitionException
  {
    SkyParmsDirectiveContext _localctx = new SkyParmsDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 26, RULE_skyParmsDirective );
    int _la;
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 164 );
        match( SKYPARMS );
        setState( 165 );
        _la = _input.LA( 1 );
        if ( !( _la == DASH || _la == LABEL ) ) {
          _errHandler.recoverInline( this );
        } else {
          if ( _input.LA( 1 ) == Token.EOF )
            matchedEOF = true;
          _errHandler.reportMatch( this );
          consume();
        }
        setState( 166 );
        _la = _input.LA( 1 );
        if ( !( _la == DASH || _la == INTEGER ) ) {
          _errHandler.recoverInline( this );
        } else {
          if ( _input.LA( 1 ) == Token.EOF )
            matchedEOF = true;
          _errHandler.reportMatch( this );
          consume();
        }
        setState( 167 );
        _la = _input.LA( 1 );
        if ( !( _la == DASH || _la == LABEL ) ) {
          _errHandler.recoverInline( this );
        } else {
          if ( _input.LA( 1 ) == Token.EOF )
            matchedEOF = true;
          _errHandler.reportMatch( this );
          consume();
        }
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class PolygonOffsetDirectiveContext extends ParserRuleContext
  {
    public TerminalNode POLYGONOFFSET() { return getToken( MaterialsParser.POLYGONOFFSET, 0 ); }

    public PolygonOffsetDirectiveContext( ParserRuleContext parent, int invokingState )
    {
      super( parent, invokingState );
    }

    @Override
    public int getRuleIndex()
    {
      return RULE_polygonOffsetDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterPolygonOffsetDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitPolygonOffsetDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitPolygonOffsetDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final PolygonOffsetDirectiveContext polygonOffsetDirective() throws RecognitionException
  {
    PolygonOffsetDirectiveContext _localctx = new PolygonOffsetDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 28, RULE_polygonOffsetDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 169 );
        match( POLYGONOFFSET );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class SortDirectiveContext extends ParserRuleContext
  {
    public TerminalNode SORT() { return getToken( MaterialsParser.SORT, 0 ); }

    public TerminalNode LABEL() { return getToken( MaterialsParser.LABEL, 0 ); }

    public NumberContext number() { return getRuleContext( NumberContext.class, 0 ); }

    public SortDirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_sortDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterSortDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitSortDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitSortDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final SortDirectiveContext sortDirective() throws RecognitionException
  {
    SortDirectiveContext _localctx = new SortDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 30, RULE_sortDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 171 );
        match( SORT );
        setState( 174 );
        _errHandler.sync( this );
        switch ( _input.LA( 1 ) ) {
          case LABEL: {
            setState( 172 );
            match( LABEL );
          } break;
          case INTEGER:
          case DECIMAL: {
            setState( 173 );
            number();
          } break;
          default:
            throw new NoViableAltException( this );
        }
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class WaveFuncContext extends ParserRuleContext
  {
    public WaveFuncContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_waveFunc;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterWaveFunc( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitWaveFunc( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitWaveFunc( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final WaveFuncContext waveFunc() throws RecognitionException
  {
    WaveFuncContext _localctx = new WaveFuncContext( _ctx, getState() );
    enterRule( _localctx, 32, RULE_waveFunc );
    try {
      enterOuterAlt( _localctx, 1 );
      {
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class NormalFuncContext extends ParserRuleContext
  {
    public NormalFuncContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_normalFunc;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterNormalFunc( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitNormalFunc( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitNormalFunc( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final NormalFuncContext normalFunc() throws RecognitionException
  {
    NormalFuncContext _localctx = new NormalFuncContext( _ctx, getState() );
    enterRule( _localctx, 34, RULE_normalFunc );
    try {
      enterOuterAlt( _localctx, 1 );
      {
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class MoveFuncContext extends ParserRuleContext
  {
    public MoveFuncContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_moveFunc;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterMoveFunc( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitMoveFunc( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitMoveFunc( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final MoveFuncContext moveFunc() throws RecognitionException
  {
    MoveFuncContext _localctx = new MoveFuncContext( _ctx, getState() );
    enterRule( _localctx, 36, RULE_moveFunc );
    try {
      enterOuterAlt( _localctx, 1 );
      {
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class BulgeFuncContext extends ParserRuleContext
  {
    public BulgeFuncContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_bulgeFunc;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterBulgeFunc( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitBulgeFunc( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitBulgeFunc( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final BulgeFuncContext bulgeFunc() throws RecognitionException
  {
    BulgeFuncContext _localctx = new BulgeFuncContext( _ctx, getState() );
    enterRule( _localctx, 38, RULE_bulgeFunc );
    try {
      enterOuterAlt( _localctx, 1 );
      {
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class ProjectionShadowFuncContext extends ParserRuleContext
  {
    public ProjectionShadowFuncContext( ParserRuleContext parent, int invokingState )
    {
      super( parent, invokingState );
    }

    @Override
    public int getRuleIndex()
    {
      return RULE_projectionShadowFunc;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterProjectionShadowFunc( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitProjectionShadowFunc( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitProjectionShadowFunc( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final ProjectionShadowFuncContext projectionShadowFunc() throws RecognitionException
  {
    ProjectionShadowFuncContext _localctx = new ProjectionShadowFuncContext( _ctx, getState() );
    enterRule( _localctx, 40, RULE_projectionShadowFunc );
    try {
      enterOuterAlt( _localctx, 1 );
      {
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class AutoSpriteFuncContext extends ParserRuleContext
  {
    public AutoSpriteFuncContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_autoSpriteFunc;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterAutoSpriteFunc( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitAutoSpriteFunc( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitAutoSpriteFunc( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final AutoSpriteFuncContext autoSpriteFunc() throws RecognitionException
  {
    AutoSpriteFuncContext _localctx = new AutoSpriteFuncContext( _ctx, getState() );
    enterRule( _localctx, 42, RULE_autoSpriteFunc );
    try {
      enterOuterAlt( _localctx, 1 );
      {
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class AutoSprite2FuncContext extends ParserRuleContext
  {
    public AutoSprite2FuncContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_autoSprite2Func;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterAutoSprite2Func( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitAutoSprite2Func( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitAutoSprite2Func( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final AutoSprite2FuncContext autoSprite2Func() throws RecognitionException
  {
    AutoSprite2FuncContext _localctx = new AutoSprite2FuncContext( _ctx, getState() );
    enterRule( _localctx, 44, RULE_autoSprite2Func );
    try {
      enterOuterAlt( _localctx, 1 );
      {
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class TextFuncContext extends ParserRuleContext
  {
    public TextFuncContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_textFunc;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterTextFunc( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitTextFunc( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitTextFunc( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final TextFuncContext textFunc() throws RecognitionException
  {
    TextFuncContext _localctx = new TextFuncContext( _ctx, getState() );
    enterRule( _localctx, 46, RULE_textFunc );
    try {
      enterOuterAlt( _localctx, 1 );
      {
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class FuncContext extends ParserRuleContext
  {
    public WaveFuncContext waveFunc() { return getRuleContext( WaveFuncContext.class, 0 ); }

    public NormalFuncContext normalFunc() { return getRuleContext( NormalFuncContext.class, 0 ); }

    public MoveFuncContext moveFunc() { return getRuleContext( MoveFuncContext.class, 0 ); }

    public BulgeFuncContext bulgeFunc() { return getRuleContext( BulgeFuncContext.class, 0 ); }

    public ProjectionShadowFuncContext projectionShadowFunc()
    {
      return getRuleContext( ProjectionShadowFuncContext.class, 0 );
    }

    public AutoSpriteFuncContext autoSpriteFunc() { return getRuleContext( AutoSpriteFuncContext.class, 0 ); }

    public AutoSprite2FuncContext autoSprite2Func() { return getRuleContext( AutoSprite2FuncContext.class, 0 ); }

    public TextFuncContext textFunc() { return getRuleContext( TextFuncContext.class, 0 ); }

    public FuncContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_func;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterFunc( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitFunc( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitFunc( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final FuncContext func() throws RecognitionException
  {
    FuncContext _localctx = new FuncContext( _ctx, getState() );
    enterRule( _localctx, 48, RULE_func );
    try {
      setState( 200 );
      _errHandler.sync( this );
      switch ( getInterpreter().adaptivePredict( _input, 11, _ctx ) ) {
        case 1:
          enterOuterAlt( _localctx, 1 );
          {
            setState( 192 );
            waveFunc();
          }
          break;
        case 2:
          enterOuterAlt( _localctx, 2 );
          {
            setState( 193 );
            normalFunc();
          }
          break;
        case 3:
          enterOuterAlt( _localctx, 3 );
          {
            setState( 194 );
            moveFunc();
          }
          break;
        case 4:
          enterOuterAlt( _localctx, 4 );
          {
            setState( 195 );
            bulgeFunc();
          }
          break;
        case 5:
          enterOuterAlt( _localctx, 5 );
          {
            setState( 196 );
            projectionShadowFunc();
          }
          break;
        case 6:
          enterOuterAlt( _localctx, 6 );
          {
            setState( 197 );
            autoSpriteFunc();
          }
          break;
        case 7:
          enterOuterAlt( _localctx, 7 );
          {
            setState( 198 );
            autoSprite2Func();
          }
          break;
        case 8:
          enterOuterAlt( _localctx, 8 );
          {
            setState( 199 );
            textFunc();
          }
          break;
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class DeformVertexesDirectiveContext extends ParserRuleContext
  {
    public TerminalNode DEFORMVERTEXES() { return getToken( MaterialsParser.DEFORMVERTEXES, 0 ); }

    public FuncContext func() { return getRuleContext( FuncContext.class, 0 ); }

    public DeformVertexesDirectiveContext( ParserRuleContext parent, int invokingState )
    {
      super( parent, invokingState );
    }

    @Override
    public int getRuleIndex()
    {
      return RULE_deformVertexesDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterDeformVertexesDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitDeformVertexesDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitDeformVertexesDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final DeformVertexesDirectiveContext deformVertexesDirective() throws RecognitionException
  {
    DeformVertexesDirectiveContext _localctx = new DeformVertexesDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 50, RULE_deformVertexesDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 202 );
        match( DEFORMVERTEXES );
        setState( 203 );
        func();
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class SurfaceParameterDirectiveContext extends ParserRuleContext
  {
    public TerminalNode SURFACE_PARM() { return getToken( MaterialsParser.SURFACE_PARM, 0 ); }

    public TerminalNode LABEL() { return getToken( MaterialsParser.LABEL, 0 ); }

    public SurfaceParameterDirectiveContext( ParserRuleContext parent, int invokingState )
    {
      super( parent, invokingState );
    }

    @Override
    public int getRuleIndex()
    {
      return RULE_surfaceParameterDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterSurfaceParameterDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitSurfaceParameterDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitSurfaceParameterDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final SurfaceParameterDirectiveContext surfaceParameterDirective() throws RecognitionException
  {
    SurfaceParameterDirectiveContext _localctx = new SurfaceParameterDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 52, RULE_surfaceParameterDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 205 );
        match( SURFACE_PARM );
        setState( 206 );
        match( LABEL );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class Q3mapDirectiveContext extends ParserRuleContext
  {
    public Q3mapSurfaceLightDirectiveContext q3mapSurfaceLightDirective()
    {
      return getRuleContext( Q3mapSurfaceLightDirectiveContext.class, 0 );
    }

    public Q3mapGlobalTextureDirectiveContext q3mapGlobalTextureDirective()
    {
      return getRuleContext( Q3mapGlobalTextureDirectiveContext.class, 0 );
    }

    public Q3mapLightImageDirectiveContext q3mapLightImageDirective()
    {
      return getRuleContext( Q3mapLightImageDirectiveContext.class, 0 );
    }

    public Q3mapNoVertexShadowsDirectiveContext q3mapNoVertexShadowsDirective()
    {
      return getRuleContext( Q3mapNoVertexShadowsDirectiveContext.class, 0 );
    }

    public Q3mapForceSunlightDirectiveContext q3mapForceSunlightDirective()
    {
      return getRuleContext( Q3mapForceSunlightDirectiveContext.class, 0 );
    }

    public Q3mapFlareDirectiveContext q3mapFlareDirective()
    {
      return getRuleContext( Q3mapFlareDirectiveContext.class, 0 );
    }

    public Q3mapLightSubdivideDirectiveContext q3mapLightSubdivideDirective()
    {
      return getRuleContext( Q3mapLightSubdivideDirectiveContext.class, 0 );
    }

    public Q3mapTessSizeDirectiveContext q3mapTessSizeDirective()
    {
      return getRuleContext( Q3mapTessSizeDirectiveContext.class, 0 );
    }

    public Q3mapBackSplashDirectiveContext q3mapBackSplashDirective()
    {
      return getRuleContext( Q3mapBackSplashDirectiveContext.class, 0 );
    }

    public Q3mapLightDirectiveContext q3mapLightDirective()
    {
      return getRuleContext( Q3mapLightDirectiveContext.class, 0 );
    }

    public Q3mapSunDirectiveContext q3mapSunDirective() { return getRuleContext( Q3mapSunDirectiveContext.class, 0 ); }

    public Q3mapDirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_q3mapDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQ3mapDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQ3mapDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQ3mapDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final Q3mapDirectiveContext q3mapDirective() throws RecognitionException
  {
    Q3mapDirectiveContext _localctx = new Q3mapDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 54, RULE_q3mapDirective );
    try {
      setState( 219 );
      _errHandler.sync( this );
      switch ( _input.LA( 1 ) ) {
        case Q3MAP_SURFACELIGHT:
          enterOuterAlt( _localctx, 1 );
          {
            setState( 208 );
            q3mapSurfaceLightDirective();
          }
          break;
        case Q3MAP_GLOBALTEXTURE:
          enterOuterAlt( _localctx, 2 );
          {
            setState( 209 );
            q3mapGlobalTextureDirective();
          }
          break;
        case Q3MAP_LIGHTIMAGE:
          enterOuterAlt( _localctx, 3 );
          {
            setState( 210 );
            q3mapLightImageDirective();
          }
          break;
        case Q3MAP_NOVERTEXSHADOWS:
          enterOuterAlt( _localctx, 4 );
          {
            setState( 211 );
            q3mapNoVertexShadowsDirective();
          }
          break;
        case Q3MAP_FORCESUNLIGHT:
          enterOuterAlt( _localctx, 5 );
          {
            setState( 212 );
            q3mapForceSunlightDirective();
          }
          break;
        case Q3MAP_FLARE:
          enterOuterAlt( _localctx, 6 );
          {
            setState( 213 );
            q3mapFlareDirective();
          }
          break;
        case Q3MAP_LIGHTSUBDIVIDE:
          enterOuterAlt( _localctx, 7 );
          {
            setState( 214 );
            q3mapLightSubdivideDirective();
          }
          break;
        case TESSSIZE:
          enterOuterAlt( _localctx, 8 );
          {
            setState( 215 );
            q3mapTessSizeDirective();
          }
          break;
        case Q3MAP_BACKSPLASH:
          enterOuterAlt( _localctx, 9 );
          {
            setState( 216 );
            q3mapBackSplashDirective();
          }
          break;
        case LIGHT:
          enterOuterAlt( _localctx, 10 );
          {
            setState( 217 );
            q3mapLightDirective();
          }
          break;
        case Q3MAP_SUN:
          enterOuterAlt( _localctx, 11 );
          {
            setState( 218 );
            q3mapSunDirective();
          }
          break;
        default:
          throw new NoViableAltException( this );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class NumberContext extends ParserRuleContext
  {
    public TerminalNode INTEGER() { return getToken( MaterialsParser.INTEGER, 0 ); }

    public TerminalNode DECIMAL() { return getToken( MaterialsParser.DECIMAL, 0 ); }

    public NumberContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_number;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterNumber( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitNumber( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitNumber( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final NumberContext number() throws RecognitionException
  {
    NumberContext _localctx = new NumberContext( _ctx, getState() );
    enterRule( _localctx, 56, RULE_number );
    int _la;
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 221 );
        _la = _input.LA( 1 );
        if ( !( _la == INTEGER || _la == DECIMAL ) ) {
          _errHandler.recoverInline( this );
        } else {
          if ( _input.LA( 1 ) == Token.EOF )
            matchedEOF = true;
          _errHandler.reportMatch( this );
          consume();
        }
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class Q3mapSurfaceLightDirectiveContext extends ParserRuleContext
  {
    public TerminalNode Q3MAP_SURFACELIGHT() { return getToken( MaterialsParser.Q3MAP_SURFACELIGHT, 0 ); }

    public TerminalNode INTEGER() { return getToken( MaterialsParser.INTEGER, 0 ); }

    public Q3mapSurfaceLightDirectiveContext( ParserRuleContext parent, int invokingState )
    {
      super( parent, invokingState );
    }

    @Override
    public int getRuleIndex()
    {
      return RULE_q3mapSurfaceLightDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQ3mapSurfaceLightDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQ3mapSurfaceLightDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQ3mapSurfaceLightDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final Q3mapSurfaceLightDirectiveContext q3mapSurfaceLightDirective() throws RecognitionException
  {
    Q3mapSurfaceLightDirectiveContext _localctx = new Q3mapSurfaceLightDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 58, RULE_q3mapSurfaceLightDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 223 );
        match( Q3MAP_SURFACELIGHT );
        setState( 224 );
        match( INTEGER );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class Q3mapGlobalTextureDirectiveContext extends ParserRuleContext
  {
    public TerminalNode Q3MAP_GLOBALTEXTURE() { return getToken( MaterialsParser.Q3MAP_GLOBALTEXTURE, 0 ); }

    public Q3mapGlobalTextureDirectiveContext( ParserRuleContext parent, int invokingState )
    {
      super( parent, invokingState );
    }

    @Override
    public int getRuleIndex()
    {
      return RULE_q3mapGlobalTextureDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQ3mapGlobalTextureDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQ3mapGlobalTextureDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQ3mapGlobalTextureDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final Q3mapGlobalTextureDirectiveContext q3mapGlobalTextureDirective() throws RecognitionException
  {
    Q3mapGlobalTextureDirectiveContext _localctx = new Q3mapGlobalTextureDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 60, RULE_q3mapGlobalTextureDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 226 );
        match( Q3MAP_GLOBALTEXTURE );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class Q3mapSunDirectiveContext extends ParserRuleContext
  {
    public TerminalNode Q3MAP_SUN() { return getToken( MaterialsParser.Q3MAP_SUN, 0 ); }

    public List<NumberContext> number() { return getRuleContexts( NumberContext.class ); }

    public NumberContext number( int i ) { return getRuleContext( NumberContext.class, i ); }

    public List<TerminalNode> INTEGER() { return getTokens( MaterialsParser.INTEGER ); }

    public TerminalNode INTEGER( int i ) { return getToken( MaterialsParser.INTEGER, i ); }

    public Q3mapSunDirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_q3mapSunDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQ3mapSunDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQ3mapSunDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQ3mapSunDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final Q3mapSunDirectiveContext q3mapSunDirective() throws RecognitionException
  {
    Q3mapSunDirectiveContext _localctx = new Q3mapSunDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 62, RULE_q3mapSunDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 228 );
        match( Q3MAP_SUN );
        setState( 229 );
        number();
        setState( 230 );
        number();
        setState( 231 );
        number();
        setState( 232 );
        match( INTEGER );
        setState( 233 );
        match( INTEGER );
        setState( 234 );
        match( INTEGER );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class Q3mapLightImageDirectiveContext extends ParserRuleContext
  {
    public TerminalNode Q3MAP_LIGHTIMAGE() { return getToken( MaterialsParser.Q3MAP_LIGHTIMAGE, 0 ); }

    public TerminalNode LABEL() { return getToken( MaterialsParser.LABEL, 0 ); }

    public Q3mapLightImageDirectiveContext( ParserRuleContext parent, int invokingState )
    {
      super( parent, invokingState );
    }

    @Override
    public int getRuleIndex()
    {
      return RULE_q3mapLightImageDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQ3mapLightImageDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQ3mapLightImageDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQ3mapLightImageDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final Q3mapLightImageDirectiveContext q3mapLightImageDirective() throws RecognitionException
  {
    Q3mapLightImageDirectiveContext _localctx = new Q3mapLightImageDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 64, RULE_q3mapLightImageDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 236 );
        match( Q3MAP_LIGHTIMAGE );
        setState( 237 );
        match( LABEL );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class Q3mapNoVertexShadowsDirectiveContext extends ParserRuleContext
  {
    public TerminalNode Q3MAP_NOVERTEXSHADOWS() { return getToken( MaterialsParser.Q3MAP_NOVERTEXSHADOWS, 0 ); }

    public Q3mapNoVertexShadowsDirectiveContext( ParserRuleContext parent, int invokingState )
    {
      super( parent, invokingState );
    }

    @Override
    public int getRuleIndex()
    {
      return RULE_q3mapNoVertexShadowsDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQ3mapNoVertexShadowsDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQ3mapNoVertexShadowsDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQ3mapNoVertexShadowsDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final Q3mapNoVertexShadowsDirectiveContext q3mapNoVertexShadowsDirective() throws RecognitionException
  {
    Q3mapNoVertexShadowsDirectiveContext _localctx = new Q3mapNoVertexShadowsDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 66, RULE_q3mapNoVertexShadowsDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 239 );
        match( Q3MAP_NOVERTEXSHADOWS );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class Q3mapForceSunlightDirectiveContext extends ParserRuleContext
  {
    public TerminalNode Q3MAP_FORCESUNLIGHT() { return getToken( MaterialsParser.Q3MAP_FORCESUNLIGHT, 0 ); }

    public Q3mapForceSunlightDirectiveContext( ParserRuleContext parent, int invokingState )
    {
      super( parent, invokingState );
    }

    @Override
    public int getRuleIndex()
    {
      return RULE_q3mapForceSunlightDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQ3mapForceSunlightDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQ3mapForceSunlightDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQ3mapForceSunlightDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final Q3mapForceSunlightDirectiveContext q3mapForceSunlightDirective() throws RecognitionException
  {
    Q3mapForceSunlightDirectiveContext _localctx = new Q3mapForceSunlightDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 68, RULE_q3mapForceSunlightDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 241 );
        match( Q3MAP_FORCESUNLIGHT );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class Q3mapFlareDirectiveContext extends ParserRuleContext
  {
    public TerminalNode Q3MAP_FLARE() { return getToken( MaterialsParser.Q3MAP_FLARE, 0 ); }

    public TerminalNode LABEL() { return getToken( MaterialsParser.LABEL, 0 ); }

    public Q3mapFlareDirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_q3mapFlareDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQ3mapFlareDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQ3mapFlareDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQ3mapFlareDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final Q3mapFlareDirectiveContext q3mapFlareDirective() throws RecognitionException
  {
    Q3mapFlareDirectiveContext _localctx = new Q3mapFlareDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 70, RULE_q3mapFlareDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 243 );
        match( Q3MAP_FLARE );
        setState( 244 );
        match( LABEL );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class Q3mapLightSubdivideDirectiveContext extends ParserRuleContext
  {
    public TerminalNode Q3MAP_LIGHTSUBDIVIDE() { return getToken( MaterialsParser.Q3MAP_LIGHTSUBDIVIDE, 0 ); }

    public TerminalNode INTEGER() { return getToken( MaterialsParser.INTEGER, 0 ); }

    public Q3mapLightSubdivideDirectiveContext( ParserRuleContext parent, int invokingState )
    {
      super( parent, invokingState );
    }

    @Override
    public int getRuleIndex()
    {
      return RULE_q3mapLightSubdivideDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQ3mapLightSubdivideDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQ3mapLightSubdivideDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQ3mapLightSubdivideDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final Q3mapLightSubdivideDirectiveContext q3mapLightSubdivideDirective() throws RecognitionException
  {
    Q3mapLightSubdivideDirectiveContext _localctx = new Q3mapLightSubdivideDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 72, RULE_q3mapLightSubdivideDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 246 );
        match( Q3MAP_LIGHTSUBDIVIDE );
        setState( 247 );
        match( INTEGER );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class Q3mapTessSizeDirectiveContext extends ParserRuleContext
  {
    public TerminalNode TESSSIZE() { return getToken( MaterialsParser.TESSSIZE, 0 ); }

    public TerminalNode INTEGER() { return getToken( MaterialsParser.INTEGER, 0 ); }

    public Q3mapTessSizeDirectiveContext( ParserRuleContext parent, int invokingState )
    {
      super( parent, invokingState );
    }

    @Override
    public int getRuleIndex()
    {
      return RULE_q3mapTessSizeDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQ3mapTessSizeDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQ3mapTessSizeDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQ3mapTessSizeDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final Q3mapTessSizeDirectiveContext q3mapTessSizeDirective() throws RecognitionException
  {
    Q3mapTessSizeDirectiveContext _localctx = new Q3mapTessSizeDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 74, RULE_q3mapTessSizeDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 249 );
        match( TESSSIZE );
        setState( 250 );
        match( INTEGER );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class Q3mapBackSplashDirectiveContext extends ParserRuleContext
  {
    public TerminalNode Q3MAP_BACKSPLASH() { return getToken( MaterialsParser.Q3MAP_BACKSPLASH, 0 ); }

    public List<TerminalNode> INTEGER() { return getTokens( MaterialsParser.INTEGER ); }

    public TerminalNode INTEGER( int i ) { return getToken( MaterialsParser.INTEGER, i ); }

    public Q3mapBackSplashDirectiveContext( ParserRuleContext parent, int invokingState )
    {
      super( parent, invokingState );
    }

    @Override
    public int getRuleIndex()
    {
      return RULE_q3mapBackSplashDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQ3mapBackSplashDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQ3mapBackSplashDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQ3mapBackSplashDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final Q3mapBackSplashDirectiveContext q3mapBackSplashDirective() throws RecognitionException
  {
    Q3mapBackSplashDirectiveContext _localctx = new Q3mapBackSplashDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 76, RULE_q3mapBackSplashDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 252 );
        match( Q3MAP_BACKSPLASH );
        setState( 253 );
        match( INTEGER );
        setState( 254 );
        match( INTEGER );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class Q3mapLightDirectiveContext extends ParserRuleContext
  {
    public TerminalNode LIGHT() { return getToken( MaterialsParser.LIGHT, 0 ); }

    public NumberContext number() { return getRuleContext( NumberContext.class, 0 ); }

    public Q3mapLightDirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_q3mapLightDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQ3mapLightDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQ3mapLightDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQ3mapLightDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final Q3mapLightDirectiveContext q3mapLightDirective() throws RecognitionException
  {
    Q3mapLightDirectiveContext _localctx = new Q3mapLightDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 78, RULE_q3mapLightDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 256 );
        match( LIGHT );
        setState( 257 );
        number();
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class QerDirectiveContext extends ParserRuleContext
  {
    public QerEditorImageDirectiveContext qerEditorImageDirective()
    {
      return getRuleContext( QerEditorImageDirectiveContext.class, 0 );
    }

    public QerNoCarveDirectiveContext qerNoCarveDirective()
    {
      return getRuleContext( QerNoCarveDirectiveContext.class, 0 );
    }

    public QerTransDirectiveContext qerTransDirective() { return getRuleContext( QerTransDirectiveContext.class, 0 ); }

    public QerDirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_qerDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQerDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQerDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQerDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final QerDirectiveContext qerDirective() throws RecognitionException
  {
    QerDirectiveContext _localctx = new QerDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 80, RULE_qerDirective );
    try {
      setState( 262 );
      _errHandler.sync( this );
      switch ( _input.LA( 1 ) ) {
        case QER_EDITORIMAGE:
          enterOuterAlt( _localctx, 1 );
          {
            setState( 259 );
            qerEditorImageDirective();
          }
          break;
        case QER_NOCARVE:
          enterOuterAlt( _localctx, 2 );
          {
            setState( 260 );
            qerNoCarveDirective();
          }
          break;
        case QER_TRANS:
          enterOuterAlt( _localctx, 3 );
          {
            setState( 261 );
            qerTransDirective();
          }
          break;
        default:
          throw new NoViableAltException( this );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class QerEditorImageDirectiveContext extends ParserRuleContext
  {
    public TerminalNode QER_EDITORIMAGE() { return getToken( MaterialsParser.QER_EDITORIMAGE, 0 ); }

    public TerminalNode LABEL() { return getToken( MaterialsParser.LABEL, 0 ); }

    public QerEditorImageDirectiveContext( ParserRuleContext parent, int invokingState )
    {
      super( parent, invokingState );
    }

    @Override
    public int getRuleIndex()
    {
      return RULE_qerEditorImageDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQerEditorImageDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQerEditorImageDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQerEditorImageDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final QerEditorImageDirectiveContext qerEditorImageDirective() throws RecognitionException
  {
    QerEditorImageDirectiveContext _localctx = new QerEditorImageDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 82, RULE_qerEditorImageDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 264 );
        match( QER_EDITORIMAGE );
        setState( 265 );
        match( LABEL );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class QerNoCarveDirectiveContext extends ParserRuleContext
  {
    public TerminalNode QER_NOCARVE() { return getToken( MaterialsParser.QER_NOCARVE, 0 ); }

    public QerNoCarveDirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_qerNoCarveDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQerNoCarveDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQerNoCarveDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQerNoCarveDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final QerNoCarveDirectiveContext qerNoCarveDirective() throws RecognitionException
  {
    QerNoCarveDirectiveContext _localctx = new QerNoCarveDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 84, RULE_qerNoCarveDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 267 );
        match( QER_NOCARVE );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static class QerTransDirectiveContext extends ParserRuleContext
  {
    public TerminalNode QER_TRANS() { return getToken( MaterialsParser.QER_TRANS, 0 ); }

    public TerminalNode DECIMAL() { return getToken( MaterialsParser.DECIMAL, 0 ); }

    public QerTransDirectiveContext( ParserRuleContext parent, int invokingState ) { super( parent, invokingState ); }

    @Override
    public int getRuleIndex()
    {
      return RULE_qerTransDirective;
    }

    @Override
    public void enterRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).enterQerTransDirective( this );
    }

    @Override
    public void exitRule( ParseTreeListener listener )
    {
      if ( listener instanceof MaterialsParserListener )
        ( (MaterialsParserListener)listener ).exitQerTransDirective( this );
    }

    @Override
    public <T> T accept( ParseTreeVisitor<? extends T> visitor )
    {
      if ( visitor instanceof MaterialsParserVisitor )
        return ( (MaterialsParserVisitor<? extends T>)visitor ).visitQerTransDirective( this );
      else
        return visitor.visitChildren( this );
    }
  }

  public final QerTransDirectiveContext qerTransDirective() throws RecognitionException
  {
    QerTransDirectiveContext _localctx = new QerTransDirectiveContext( _ctx, getState() );
    enterRule( _localctx, 86, RULE_qerTransDirective );
    try {
      enterOuterAlt( _localctx, 1 );
      {
        setState( 269 );
        match( QER_TRANS );
        setState( 270 );
        match( DECIMAL );
      }
    } catch ( RecognitionException re ) {
      _localctx.exception = re;
      _errHandler.reportError( this, re );
      _errHandler.recover( this, re );
    } finally {
      exitRule();
    }
    return _localctx;
  }

  public static final String _serializedATN =
    "\u0004\u00018\u0111\u0002\u0000\u0007\u0000\u0002\u0001\u0007\u0001\u0002"
    + "\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002\u0004\u0007\u0004\u0002"
    + "\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002\u0007\u0007\u0007\u0002"
    + "\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002\u000b\u0007\u000b\u0002"
    + "\f\u0007\f\u0002\r\u0007\r\u0002\u000e\u0007\u000e\u0002\u000f\u0007\u000f"
    + "\u0002\u0010\u0007\u0010\u0002\u0011\u0007\u0011\u0002\u0012\u0007\u0012"
    + "\u0002\u0013\u0007\u0013\u0002\u0014\u0007\u0014\u0002\u0015\u0007\u0015"
    + "\u0002\u0016\u0007\u0016\u0002\u0017\u0007\u0017\u0002\u0018\u0007\u0018"
    + "\u0002\u0019\u0007\u0019\u0002\u001a\u0007\u001a\u0002\u001b\u0007\u001b"
    + "\u0002\u001c\u0007\u001c\u0002\u001d\u0007\u001d\u0002\u001e\u0007\u001e"
    + "\u0002\u001f\u0007\u001f\u0002 \u0007 \u0002!\u0007!\u0002\"\u0007\"\u0002"
    + "#\u0007#\u0002$\u0007$\u0002%\u0007%\u0002&\u0007&\u0002\'\u0007\'\u0002"
    + "(\u0007(\u0002)\u0007)\u0002*\u0007*\u0002+\u0007+\u0001\u0000\u0001\u0000"
    + "\u0001\u0000\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001"
    + "\u0003\u0001a\b\u0001\u0001\u0002\u0005\u0002d\b\u0002\n\u0002\f\u0002"
    + "g\t\u0002\u0001\u0002\u0003\u0002j\b\u0002\u0001\u0003\u0001\u0003\u0001"
    + "\u0003\u0001\u0003\u0001\u0003\u0001\u0004\u0001\u0004\u0001\u0004\u0001"
    + "\u0004\u0003\u0004u\b\u0004\u0001\u0005\u0001\u0005\u0001\u0005\u0001"
    + "\u0005\u0003\u0005{\b\u0005\u0001\u0006\u0001\u0006\u0001\u0006\u0001"
    + "\u0006\u0001\u0006\u0001\u0006\u0001\u0006\u0001\u0006\u0001\u0006\u0001"
    + "\u0006\u0003\u0006\u0087\b\u0006\u0001\u0007\u0001\u0007\u0001\u0007\u0001"
    + "\b\u0001\b\u0001\t\u0001\t\u0001\n\u0001\n\u0001\u000b\u0001\u000b\u0001"
    + "\f\u0001\f\u0003\f\u0096\b\f\u0001\f\u0001\f\u0001\f\u0001\f\u0003\f\u009c"
    + "\b\f\u0001\f\u0001\f\u0003\f\u00a0\b\f\u0001\f\u0003\f\u00a3\b\f\u0001"
    + "\r\u0001\r\u0001\r\u0001\r\u0001\r\u0001\u000e\u0001\u000e\u0001\u000f"
    + "\u0001\u000f\u0001\u000f\u0003\u000f\u00af\b\u000f\u0001\u0010\u0001\u0010"
    + "\u0001\u0011\u0001\u0011\u0001\u0012\u0001\u0012\u0001\u0013\u0001\u0013"
    + "\u0001\u0014\u0001\u0014\u0001\u0015\u0001\u0015\u0001\u0016\u0001\u0016"
    + "\u0001\u0017\u0001\u0017\u0001\u0018\u0001\u0018\u0001\u0018\u0001\u0018"
    + "\u0001\u0018\u0001\u0018\u0001\u0018\u0001\u0018\u0003\u0018\u00c9\b\u0018"
    + "\u0001\u0019\u0001\u0019\u0001\u0019\u0001\u001a\u0001\u001a\u0001\u001a"
    + "\u0001\u001b\u0001\u001b\u0001\u001b\u0001\u001b\u0001\u001b\u0001\u001b"
    + "\u0001\u001b\u0001\u001b\u0001\u001b\u0001\u001b\u0001\u001b\u0003\u001b"
    + "\u00dc\b\u001b\u0001\u001c\u0001\u001c\u0001\u001d\u0001\u001d\u0001\u001d"
    + "\u0001\u001e\u0001\u001e\u0001\u001f\u0001\u001f\u0001\u001f\u0001\u001f"
    + "\u0001\u001f\u0001\u001f\u0001\u001f\u0001\u001f\u0001 \u0001 \u0001 "
    + "\u0001!\u0001!\u0001\"\u0001\"\u0001#\u0001#\u0001#\u0001$\u0001$\u0001"
    + "$\u0001%\u0001%\u0001%\u0001&\u0001&\u0001&\u0001&\u0001\'\u0001\'\u0001"
    + "\'\u0001(\u0001(\u0001(\u0003(\u0107\b(\u0001)\u0001)\u0001)\u0001*\u0001"
    + "*\u0001+\u0001+\u0001+\u0001+\u0000\u0000,\u0000\u0002\u0004\u0006\b\n"
    + "\f\u000e\u0010\u0012\u0014\u0016\u0018\u001a\u001c\u001e \"$&(*,.0246"
    + "8:<>@BDFHJLNPRTV\u0000\u0004\u0001\u0000\u0007\f\u0002\u0000\u0005\u0005"
    + "66\u0002\u0000\u0005\u000544\u0001\u000045\u010c\u0000X\u0001\u0000\u0000"
    + "\u0000\u0002`\u0001\u0000\u0000\u0000\u0004i\u0001\u0000\u0000\u0000\u0006"
    + "k\u0001\u0000\u0000\u0000\bt\u0001\u0000\u0000\u0000\nz\u0001\u0000\u0000"
    + "\u0000\f\u0086\u0001\u0000\u0000\u0000\u000e\u0088\u0001\u0000\u0000\u0000"
    + "\u0010\u008b\u0001\u0000\u0000\u0000\u0012\u008d\u0001\u0000\u0000\u0000"
    + "\u0014\u008f\u0001\u0000\u0000\u0000\u0016\u0091\u0001\u0000\u0000\u0000"
    + "\u0018\u0093\u0001\u0000\u0000\u0000\u001a\u00a4\u0001\u0000\u0000\u0000"
    + "\u001c\u00a9\u0001\u0000\u0000\u0000\u001e\u00ab\u0001\u0000\u0000\u0000"
    + " \u00b0\u0001\u0000\u0000\u0000\"\u00b2\u0001\u0000\u0000\u0000$\u00b4"
    + "\u0001\u0000\u0000\u0000&\u00b6\u0001\u0000\u0000\u0000(\u00b8\u0001\u0000"
    + "\u0000\u0000*\u00ba\u0001\u0000\u0000\u0000,\u00bc\u0001\u0000\u0000\u0000"
    + ".\u00be\u0001\u0000\u0000\u00000\u00c8\u0001\u0000\u0000\u00002\u00ca"
    + "\u0001\u0000\u0000\u00004\u00cd\u0001\u0000\u0000\u00006\u00db\u0001\u0000"
    + "\u0000\u00008\u00dd\u0001\u0000\u0000\u0000:\u00df\u0001\u0000\u0000\u0000"
    + "<\u00e2\u0001\u0000\u0000\u0000>\u00e4\u0001\u0000\u0000\u0000@\u00ec"
    + "\u0001\u0000\u0000\u0000B\u00ef\u0001\u0000\u0000\u0000D\u00f1\u0001\u0000"
    + "\u0000\u0000F\u00f3\u0001\u0000\u0000\u0000H\u00f6\u0001\u0000\u0000\u0000"
    + "J\u00f9\u0001\u0000\u0000\u0000L\u00fc\u0001\u0000\u0000\u0000N\u0100"
    + "\u0001\u0000\u0000\u0000P\u0106\u0001\u0000\u0000\u0000R\u0108\u0001\u0000"
    + "\u0000\u0000T\u010b\u0001\u0000\u0000\u0000V\u010d\u0001\u0000\u0000\u0000"
    + "XY\u0003\u0002\u0001\u0000YZ\u0005\u0000\u0000\u0001Z\u0001\u0001\u0000"
    + "\u0000\u0000[\\\u0003\u0004\u0002\u0000\\]\u0003\u0006\u0003\u0000]^\u0003"
    + "\u0002\u0001\u0000^a\u0001\u0000\u0000\u0000_a\u0001\u0000\u0000\u0000"
    + "`[\u0001\u0000\u0000\u0000`_\u0001\u0000\u0000\u0000a\u0003\u0001\u0000"
    + "\u0000\u0000bd\u00058\u0000\u0000cb\u0001\u0000\u0000\u0000dg\u0001\u0000"
    + "\u0000\u0000ec\u0001\u0000\u0000\u0000ef\u0001\u0000\u0000\u0000fj\u0001"
    + "\u0000\u0000\u0000ge\u0001\u0000\u0000\u0000hj\u0001\u0000\u0000\u0000"
    + "ie\u0001\u0000\u0000\u0000ih\u0001\u0000\u0000\u0000j\u0005\u0001\u0000"
    + "\u0000\u0000kl\u00056\u0000\u0000lm\u0005\u0001\u0000\u0000mn\u0003\b"
    + "\u0004\u0000no\u0005\u0002\u0000\u0000o\u0007\u0001\u0000\u0000\u0000"
    + "pq\u0003\n\u0005\u0000qr\u0003\b\u0004\u0000ru\u0001\u0000\u0000\u0000"
    + "su\u0001\u0000\u0000\u0000tp\u0001\u0000\u0000\u0000ts\u0001\u0000\u0000"
    + "\u0000u\t\u0001\u0000\u0000\u0000v{\u0003\f\u0006\u0000w{\u00036\u001b"
    + "\u0000x{\u00034\u001a\u0000y{\u0003P(\u0000zv\u0001\u0000\u0000\u0000"
    + "zw\u0001\u0000\u0000\u0000zx\u0001\u0000\u0000\u0000zy\u0001\u0000\u0000"
    + "\u0000{\u000b\u0001\u0000\u0000\u0000|\u0087\u0003\u000e\u0007\u0000}"
    + "\u0087\u0003\u0010\b\u0000~\u0087\u0003\u0012\t\u0000\u007f\u0087\u0003"
    + "\u0014\n\u0000\u0080\u0087\u0003\u0016\u000b\u0000\u0081\u0087\u0003\u0018"
    + "\f\u0000\u0082\u0087\u0003\u001a\r\u0000\u0083\u0087\u0003\u001c\u000e"
    + "\u0000\u0084\u0087\u0003\u001e\u000f\u0000\u0085\u0087\u00032\u0019\u0000"
    + "\u0086|\u0001\u0000\u0000\u0000\u0086}\u0001\u0000\u0000\u0000\u0086~"
    + "\u0001\u0000\u0000\u0000\u0086\u007f\u0001\u0000\u0000\u0000\u0086\u0080"
    + "\u0001\u0000\u0000\u0000\u0086\u0081\u0001\u0000\u0000\u0000\u0086\u0082"
    + "\u0001\u0000\u0000\u0000\u0086\u0083\u0001\u0000\u0000\u0000\u0086\u0084"
    + "\u0001\u0000\u0000\u0000\u0086\u0085\u0001\u0000\u0000\u0000\u0087\r\u0001"
    + "\u0000\u0000\u0000\u0088\u0089\u0005\u0006\u0000\u0000\u0089\u008a\u0007"
    + "\u0000\u0000\u0000\u008a\u000f\u0001\u0000\u0000\u0000\u008b\u008c\u0005"
    + "\r\u0000\u0000\u008c\u0011\u0001\u0000\u0000\u0000\u008d\u008e\u0005\u000e"
    + "\u0000\u0000\u008e\u0013\u0001\u0000\u0000\u0000\u008f\u0090\u0005\u000f"
    + "\u0000\u0000\u0090\u0015\u0001\u0000\u0000\u0000\u0091\u0092\u0005\u0010"
    + "\u0000\u0000\u0092\u0017\u0001\u0000\u0000\u0000\u0093\u0095\u0005\u0011"
    + "\u0000\u0000\u0094\u0096\u0005\u0003\u0000\u0000\u0095\u0094\u0001\u0000"
    + "\u0000\u0000\u0095\u0096\u0001\u0000\u0000\u0000\u0096\u0097\u0001\u0000"
    + "\u0000\u0000\u0097\u0098\u00038\u001c\u0000\u0098\u0099\u00038\u001c\u0000"
    + "\u0099\u009b\u00038\u001c\u0000\u009a\u009c\u0005\u0004\u0000\u0000\u009b"
    + "\u009a\u0001\u0000\u0000\u0000\u009b\u009c\u0001\u0000\u0000\u0000\u009c"
    + "\u009d\u0001\u0000\u0000\u0000\u009d\u009f\u00038\u001c\u0000\u009e\u00a0"
    + "\u00038\u001c\u0000\u009f\u009e\u0001\u0000\u0000\u0000\u009f\u00a0\u0001"
    + "\u0000\u0000\u0000\u00a0\u00a2\u0001\u0000\u0000\u0000\u00a1\u00a3\u0003"
    + "8\u001c\u0000\u00a2\u00a1\u0001\u0000\u0000\u0000\u00a2\u00a3\u0001\u0000"
    + "\u0000\u0000\u00a3\u0019\u0001\u0000\u0000\u0000\u00a4\u00a5\u0005\u0012"
    + "\u0000\u0000\u00a5\u00a6\u0007\u0001\u0000\u0000\u00a6\u00a7\u0007\u0002"
    + "\u0000\u0000\u00a7\u00a8\u0007\u0001\u0000\u0000\u00a8\u001b\u0001\u0000"
    + "\u0000\u0000\u00a9\u00aa\u0005\u0013\u0000\u0000\u00aa\u001d\u0001\u0000"
    + "\u0000\u0000\u00ab\u00ae\u0005$\u0000\u0000\u00ac\u00af\u00056\u0000\u0000"
    + "\u00ad\u00af\u00038\u001c\u0000\u00ae\u00ac\u0001\u0000\u0000\u0000\u00ae"
    + "\u00ad\u0001\u0000\u0000\u0000\u00af\u001f\u0001\u0000\u0000\u0000\u00b0"
    + "\u00b1\u0001\u0000\u0000\u0000\u00b1!\u0001\u0000\u0000\u0000\u00b2\u00b3"
    + "\u0001\u0000\u0000\u0000\u00b3#\u0001\u0000\u0000\u0000\u00b4\u00b5\u0001"
    + "\u0000\u0000\u0000\u00b5%\u0001\u0000\u0000\u0000\u00b6\u00b7\u0001\u0000"
    + "\u0000\u0000\u00b7\'\u0001\u0000\u0000\u0000\u00b8\u00b9\u0001\u0000\u0000"
    + "\u0000\u00b9)\u0001\u0000\u0000\u0000\u00ba\u00bb\u0001\u0000\u0000\u0000"
    + "\u00bb+\u0001\u0000\u0000\u0000\u00bc\u00bd\u0001\u0000\u0000\u0000\u00bd"
    + "-\u0001\u0000\u0000\u0000\u00be\u00bf\u0001\u0000\u0000\u0000\u00bf/\u0001"
    + "\u0000\u0000\u0000\u00c0\u00c9\u0003 \u0010\u0000\u00c1\u00c9\u0003\""
    + "\u0011\u0000\u00c2\u00c9\u0003$\u0012\u0000\u00c3\u00c9\u0003&\u0013\u0000"
    + "\u00c4\u00c9\u0003(\u0014\u0000\u00c5\u00c9\u0003*\u0015\u0000\u00c6\u00c9"
    + "\u0003,\u0016\u0000\u00c7\u00c9\u0003.\u0017\u0000\u00c8\u00c0\u0001\u0000"
    + "\u0000\u0000\u00c8\u00c1\u0001\u0000\u0000\u0000\u00c8\u00c2\u0001\u0000"
    + "\u0000\u0000\u00c8\u00c3\u0001\u0000\u0000\u0000\u00c8\u00c4\u0001\u0000"
    + "\u0000\u0000\u00c8\u00c5\u0001\u0000\u0000\u0000\u00c8\u00c6\u0001\u0000"
    + "\u0000\u0000\u00c8\u00c7\u0001\u0000\u0000\u0000\u00c91\u0001\u0000\u0000"
    + "\u0000\u00ca\u00cb\u0005\u0014\u0000\u0000\u00cb\u00cc\u00030\u0018\u0000"
    + "\u00cc3\u0001\u0000\u0000\u0000\u00cd\u00ce\u00053\u0000\u0000\u00ce\u00cf"
    + "\u00056\u0000\u0000\u00cf5\u0001\u0000\u0000\u0000\u00d0\u00dc\u0003:"
    + "\u001d\u0000\u00d1\u00dc\u0003<\u001e\u0000\u00d2\u00dc\u0003@ \u0000"
    + "\u00d3\u00dc\u0003B!\u0000\u00d4\u00dc\u0003D\"\u0000\u00d5\u00dc\u0003"
    + "F#\u0000\u00d6\u00dc\u0003H$\u0000\u00d7\u00dc\u0003J%\u0000\u00d8\u00dc"
    + "\u0003L&\u0000\u00d9\u00dc\u0003N\'\u0000\u00da\u00dc\u0003>\u001f\u0000"
    + "\u00db\u00d0\u0001\u0000\u0000\u0000\u00db\u00d1\u0001\u0000\u0000\u0000"
    + "\u00db\u00d2\u0001\u0000\u0000\u0000\u00db\u00d3\u0001\u0000\u0000\u0000"
    + "\u00db\u00d4\u0001\u0000\u0000\u0000\u00db\u00d5\u0001\u0000\u0000\u0000"
    + "\u00db\u00d6\u0001\u0000\u0000\u0000\u00db\u00d7\u0001\u0000\u0000\u0000"
    + "\u00db\u00d8\u0001\u0000\u0000\u0000\u00db\u00d9\u0001\u0000\u0000\u0000"
    + "\u00db\u00da\u0001\u0000\u0000\u0000\u00dc7\u0001\u0000\u0000\u0000\u00dd"
    + "\u00de\u0007\u0003\u0000\u0000\u00de9\u0001\u0000\u0000\u0000\u00df\u00e0"
    + "\u0005\'\u0000\u0000\u00e0\u00e1\u00054\u0000\u0000\u00e1;\u0001\u0000"
    + "\u0000\u0000\u00e2\u00e3\u0005&\u0000\u0000\u00e3=\u0001\u0000\u0000\u0000"
    + "\u00e4\u00e5\u0005,\u0000\u0000\u00e5\u00e6\u00038\u001c\u0000\u00e6\u00e7"
    + "\u00038\u001c\u0000\u00e7\u00e8\u00038\u001c\u0000\u00e8\u00e9\u00054"
    + "\u0000\u0000\u00e9\u00ea\u00054\u0000\u0000\u00ea\u00eb\u00054\u0000\u0000"
    + "\u00eb?\u0001\u0000\u0000\u0000\u00ec\u00ed\u0005%\u0000\u0000\u00ed\u00ee"
    + "\u00056\u0000\u0000\u00eeA\u0001\u0000\u0000\u0000\u00ef\u00f0\u0005("
    + "\u0000\u0000\u00f0C\u0001\u0000\u0000\u0000\u00f1\u00f2\u0005)\u0000\u0000"
    + "\u00f2E\u0001\u0000\u0000\u0000\u00f3\u00f4\u0005.\u0000\u0000\u00f4\u00f5"
    + "\u00056\u0000\u0000\u00f5G\u0001\u0000\u0000\u0000\u00f6\u00f7\u0005*"
    + "\u0000\u0000\u00f7\u00f8\u00054\u0000\u0000\u00f8I\u0001\u0000\u0000\u0000"
    + "\u00f9\u00fa\u0005-\u0000\u0000\u00fa\u00fb\u00054\u0000\u0000\u00fbK"
    + "\u0001\u0000\u0000\u0000\u00fc\u00fd\u0005+\u0000\u0000\u00fd\u00fe\u0005"
    + "4\u0000\u0000\u00fe\u00ff\u00054\u0000\u0000\u00ffM\u0001\u0000\u0000"
    + "\u0000\u0100\u0101\u0005/\u0000\u0000\u0101\u0102\u00038\u001c\u0000\u0102"
    + "O\u0001\u0000\u0000\u0000\u0103\u0107\u0003R)\u0000\u0104\u0107\u0003"
    + "T*\u0000\u0105\u0107\u0003V+\u0000\u0106\u0103\u0001\u0000\u0000\u0000"
    + "\u0106\u0104\u0001\u0000\u0000\u0000\u0106\u0105\u0001\u0000\u0000\u0000"
    + "\u0107Q\u0001\u0000\u0000\u0000\u0108\u0109\u00050\u0000\u0000\u0109\u010a"
    + "\u00056\u0000\u0000\u010aS\u0001\u0000\u0000\u0000\u010b\u010c\u00051"
    + "\u0000\u0000\u010cU\u0001\u0000\u0000\u0000\u010d\u010e\u00052\u0000\u0000"
    + "\u010e\u010f\u00055\u0000\u0000\u010fW\u0001\u0000\u0000\u0000\u000e`"
    + "eitz\u0086\u0095\u009b\u009f\u00a2\u00ae\u00c8\u00db\u0106";
  public static final ATN _ATN = new ATNDeserializer().deserialize( _serializedATN.toCharArray() );

  static
  {
    _decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
    for ( int i = 0; i < _ATN.getNumberOfDecisions(); i++ ) {
      _decisionToDFA[i] = new DFA( _ATN.getDecisionState( i ), i );
    }
  }
}
