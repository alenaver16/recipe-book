<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRecipeIngridientTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('recipe_ingridient', function (Blueprint $table) {
            $table->integer('recipe_id')->unsigned();
            $table->foreign('recipe_id')
                ->references('id')->on('recipes')
                ->onDelete('cascade');
            $table->integer('ingridient_id')->unsigned();
            $table->foreign('ingridient_id')
                ->references('id')->on('ingridients')
                ->onDelete('cascade');
            $table->double('count')->unsigned();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('recipe_ingridient');
    }
}
