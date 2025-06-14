Schema::create('categories', function (Blueprint $table) {
$table->id();
$table->string('name');
$table->foreignId('user_id')->constrained()->onDelete('cascade');
$table->timestamps();
});
