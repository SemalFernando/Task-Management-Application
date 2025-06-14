Schema::create('tasks', function (Blueprint $table) {
$table->id();
$table->string('title');
$table->text('description')->nullable();
$table->date('due_date')->nullable();
$table->enum('status', ['pending', 'in_progress', 'completed'])->default('pending');
$table->foreignId('category_id')->constrained()->onDelete('cascade');
$table->foreignId('user_id')->constrained()->onDelete('cascade');
$table->timestamps();
});
