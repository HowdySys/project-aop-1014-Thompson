public aspect TraceAspectThompson {
	pointcut classToTrace(): within(*App);
	pointcut methodToTrace():  classToTrace() && execution(String getName(..));
	
	before(): methodToTrace() {
	      System.out.println("\t-->" + thisJoinPointStaticPart.getSignature() + //
	            ", kind: " + thisJoinPointStaticPart.getKind() + //
	            ", loc: " + thisJoinPointStaticPart.getSourceLocation().getFileName() + ", " + //
	            thisJoinPointStaticPart.getSourceLocation().getWithinType() + ", " + //
	            thisJoinPointStaticPart.getSourceLocation().getLine());
	   }

	   after(): methodToTrace() {
	      System.out.println("\t<--" + thisJoinPointStaticPart.getSignature());
	   }
}
